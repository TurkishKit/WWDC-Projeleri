import SwiftUI

struct EmitterView: UIViewRepresentable {
    
    // MARK: - Properties
    @Binding var position: CGPoint

    // MARK: - Functions
    func makeUIView(context: Context) -> UIView {
        let size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        let host = UIView(frame: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
        
        let names = ["Green", "Red", "Yellow", "Orange", "Purple", "Blue"]
        var cells: [CAEmitterCell] = []

        for name in names {
            let image = UIImage(named: "Images/\(name)")?.cgImage

            let cell = CAEmitterCell()
            cell.contents = image
            cell.birthRate = 30
            cell.lifetime = 8
            cell.velocity = 300.0
            cell.velocityRange = 1000
            cell.xAcceleration = 300
            cell.yAcceleration = 300
            cell.emissionLatitude = 164.0 * (.pi / 180.0)
            cell.emissionLongitude = 44.0 * (.pi / 180.0)
            cell.emissionRange = 360.0 * (.pi / 180.0)
            cell.spin = 80 * (.pi / 180.0)
            cell.spinRange = 314.0 * (.pi / 180.0)
            cell.scale = 0.113
            cell.scaleSpeed = -0.077
            cell.alphaSpeed = 0.42
            cell.redRange = 0.3
            cell.greenRange = 0.21
            cell.blueRange = 0.6

            cells.append(cell)
        }
        
        let firstParticlesLayer = CAEmitterLayer()
        firstParticlesLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        let secondParticlesLayer = CAEmitterLayer()
        secondParticlesLayer.frame = CGRect(x: size.width, y: 0, width: size.width, height: size.height)
        
        let thirdParticlesLayer = CAEmitterLayer()
        thirdParticlesLayer.frame = CGRect(x: size.width, y: size.height, width: size.width, height: size.height)
        
        let fourthParticlesLayer = CAEmitterLayer()
        fourthParticlesLayer.frame = CGRect(x: 0, y: size.height, width: size.width, height: size.height)
        
        let layers = [firstParticlesLayer, secondParticlesLayer, thirdParticlesLayer, fourthParticlesLayer]

        for layer in layers {
            host.layer.addSublayer(layer)
            
            layer.emitterShape = .circle
            layer.emitterPosition = CGPoint(x: position.x, y: position.y)
            layer.emitterSize = CGSize(width: 0, height: 0)
            layer.emitterMode = .surface
            layer.renderMode = .additive
            
            layer.emitterCells = cells
        }

        host.layer.masksToBounds = true
        
        return host
    }

    func updateUIView(_ uiView: UIView, context: Context) {}

    typealias UIViewType = UIView
}
