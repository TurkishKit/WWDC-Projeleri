import SwiftUI

public struct EmitterView: UIViewRepresentable {
    
    // MARK: - Properties
    @Binding public var position: CGPoint

    // MARK: - Life Cycle
    public init(position: Binding<CGPoint>) {
        _position = position
    }
    
    // MARK: - Functions
    public func makeUIView(context: Context) -> UIView {
        let size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        let host = UIView(frame: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))

        let particlesLayer = CAEmitterLayer()
        particlesLayer.frame = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)

        host.layer.addSublayer(particlesLayer)
        host.layer.masksToBounds = true

        particlesLayer.emitterShape = .circle
        particlesLayer.emitterPosition = CGPoint(x: 509.4, y: 707.7)
        particlesLayer.emitterSize = CGSize(width: 1648.0, height: 1112.0)
        particlesLayer.emitterMode = .surface
        particlesLayer.renderMode = .oldestLast
        
        let names = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
        var cells: [CAEmitterCell] = []
        
        for name in names {
            let image = UIImage(named: "AI-Photos/\(name).jpg")?.cgImage
            
            let cell = CAEmitterCell()
            cell.contents = image
            cell.birthRate = 15.0
            cell.lifetime = 20.0
            cell.velocity = 3.0
            cell.velocityRange = -15.0
            cell.xAcceleration = 5.0
            cell.yAcceleration = 40.0
            cell.emissionRange = 180.0 * (.pi / 180.0)
            cell.spin = -28.6 * (.pi / 180.0)
            cell.spinRange = 57.2 * (.pi / 180.0)
            cell.scale = 0.06
            cell.scaleRange = 0.3
            
            cells.append(cell)
        }
        
        particlesLayer.emitterCells = cells

        return host
    }

    public func updateUIView(_ uiView: UIView, context: Context) {}

    public typealias UIViewType = UIView
}
