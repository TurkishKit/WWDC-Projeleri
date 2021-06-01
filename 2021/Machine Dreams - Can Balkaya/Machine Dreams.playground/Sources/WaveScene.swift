import SwiftUI
import SceneKit
import Accelerate
import CoreML

public class WaveScene: SCNScene {
    
    // MARK: - Enumerations
    public enum SceneCase {
        case aiDataSculpture
        case machineMemories
        case machineHallucinations
    }
    
    // MARK: - Properties
    let sceneCase: SceneCase
    var selectedImages: [UIImage]! = []
    var aiImages: [UIImage] {
        var images: [UIImage] = []
        for index in 1...10 { images.append(UIImage(named: "AI-Photos/\(index).jpg")!) }
        return images
    }

    var oscillators = [Oscillator3D]()
    var waves = [Wave3D]()
    @State var wave = Wave.example
    @State var waveCount = 3
    var currentTime = TimeInterval()
    var contentNode = SCNNode()
    var timeCount = 0
    var pixelIntervals: (x: Double, y: Double) = (x: 0, y: 0)
    
    // MARK: - Life Cycle
    public init(sceneCase: SceneCase, selectedImages: [UIImage]? = nil, centerDistance: Float, radius: CGFloat) {
        self.sceneCase = sceneCase
        
        super.init()
        
        if sceneCase == .machineMemories {
            self.selectedImages = selectedImages
        } else {
            self.selectedImages = aiImages
        }
        
        let amounts = getAmounts()
        generateOscillators(xAmount: amounts.xAmount, yAmount: amounts.yAmount, centerDistance: centerDistance, radius: radius)
        rootNode.addChildNode(contentNode)
    }
    
    required init?(coder: NSCoder) {
        fatalError(coder.error!.localizedDescription)
    }
    
    // MARK: - Methods
    public func generateOscillators(xAmount: Int, yAmount: Int, centerDistance: Float, radius: CGFloat) {
        setTimeCount()
        background.contents = generateSkyboxAssets()
        let sphereGeometry = SCNSphere(radius: radius)
        sphereGeometry.firstMaterial?.lightingModel = .lambert
        
        let origin = -Float(xAmount) * centerDistance / 2
        for thisX in 1...xAmount {
            for thisY in 1...yAmount {
                let node = SCNNode(geometry: sphereGeometry)
                node.geometry = node.geometry?.copy() as? SCNGeometry
                node.geometry?.firstMaterial = node.geometry?.firstMaterial?.copy() as? SCNMaterial
                node.geometry!.firstMaterial!.diffuse.contents = UIColor.clear
                
                node.position = SCNVector3(
                    origin + Float(thisX) * centerDistance,
                    origin - Float(thisY) * centerDistance,
                    0
                )
                
                var oscilator = Oscillator3D(node: node)
                oscilator.location.x = CGFloat(thisX)
                oscilator.location.y = CGFloat(thisY)
                oscillators.append(oscilator)
                contentNode.addChildNode(node)
            }
        }
    }
    
    public func addWave(wave: Wave) {
        guard let source = oscillators.randomElement(),
            !waves.contains(where: { $0.source == source }) else { return }
        let wave3D = Wave3D(source: source, model: wave, t₀: currentTime)
        waves.append(wave3D)
        updateDistances()
    }
    
    public func removeWave() {
        waves.removeAll { $0.source.node == contentNode }
        updateDistances()
    }
    
    public func updateElongations() {
        setTimeCount()
        timeCount += 1
        
        if waves.count < waveCount {
            addWave(wave: wave)
        }
        
        oscillators.forEach { oscillator in
            let enumeratedWaves = waves.enumerated()
            let innerValues: [Float] = enumeratedWaves.map { (index, wave) in
                let t = (currentTime - wave.t₀)
                guard oscillator.distances.indices.contains(index) else { return 0 }
                let distance = oscillator.distances[index]
                guard wave.model.c * Float(t) >= distance else { return 0 }
                return Float(wave.model.oscillation.ω * t) - 2 * .pi * oscillator.distances[index] / wave.model.λ
            }
            let sineValues = vForce.sin(innerValues)
            let superposedZValues: [Float] = enumeratedWaves.map { index, wave in
                guard sineValues.indices.contains(index) else { return 0 }
                return Float(wave.model.oscillation.ŷ) * sineValues[index]
            }
            let actualZValue = vDSP.sum(superposedZValues)
            oscillator.node.position.z = actualZValue
        }
        
        for _ in 1...20 {
            guard let source = self.oscillators.randomElement() else { return }
            let xLocation = source.location.x
            let yLocation = source.location.y
            let xInterval = CGFloat(pixelIntervals.x)
            let yInterval = CGFloat(pixelIntervals.y)
            let x = xLocation * xInterval
            let y = yLocation * yInterval
            
            source.node.geometry = source.node.geometry?.copy() as? SCNGeometry
            source.node.geometry?.firstMaterial = source.node.geometry?.firstMaterial?.copy() as? SCNMaterial
            source.node.geometry?.firstMaterial?.diffuse.contents = selectedImages[getCurrentImageIndex()].getPixelColor(pos: CGPoint(x: x, y: y))
        }
    }
    
    public func getAmounts() -> (xAmount: Int, yAmount: Int) {
        let maxPixelCount = 71
        
        var xAmount = 0
        var yAmount = 0
        
        let index = getCurrentImageIndex()
        let selectedImage = selectedImages[index]
        
        let width = selectedImage.cgImage!.width
        let height = selectedImage.cgImage!.height
        
        if width < maxPixelCount {
            xAmount = width
        } else {
            xAmount = maxPixelCount
            pixelIntervals.x = Double(width) / Double(maxPixelCount)
        }
        
        if height < maxPixelCount {
            yAmount = height
        } else {
            yAmount = maxPixelCount
            pixelIntervals.y = Double(height) / Double(maxPixelCount)
        }
        
        return (xAmount: xAmount, yAmount: yAmount)
    }
    
    public func changeWave(for identifier: String) {
        if sceneCase == .machineHallucinations {
            switch identifier {
            case "angry":
                wave = Wave(oscillation: Oscillation(ŷ: 0.3, f: 0.8), c: 0.8)
                timeCount = 300
                waveCount = 6
            case "disgust":
                wave = Wave(oscillation: Oscillation(ŷ: 0.3, f: 0.6), c: 0.6)
                timeCount = 600
                waveCount = 3
            case "fear":
                wave = Wave(oscillation: Oscillation(ŷ: 0.3, f: 0.7), c: 0.7)
                timeCount = 900
                waveCount = 2
            case "happiness":
                wave = Wave(oscillation: Oscillation(ŷ: 0.3, f: 0.5), c: 0.9)
                timeCount = 1200
                waveCount = 4
            case "neutral":
                wave = Wave(oscillation: Oscillation(ŷ: 0.06, f: 0.4), c: 0.9)
                timeCount = 1500
                waveCount = 3
            case "sadness":
                wave = Wave(oscillation: Oscillation(ŷ: 0.08, f: 0.1), c: 0.8)
                timeCount = 1800
                waveCount = 1
            case "surprise":
                wave = Wave(oscillation: Oscillation(ŷ: 0.15, f: 0.7), c: 0.7)
                timeCount = 2100
                waveCount = 5
            default:
                break
            }
        }
    }
    
    private func setTimeCount() {
        let count = selectedImages.count
        if timeCount+1 == count * 300 {
            timeCount = 0
        }
    }
    
    private func getCurrentImageIndex() -> Int {
        return timeCount / 300
    }
    
    private func updateDistances() {
        DispatchQueue.global(qos: .userInitiated).async {
            for (index, oscillator) in self.oscillators.enumerated() {
                let oscillatorOrigin = [oscillator.node.position.x, oscillator.node.position.y]
                let waveOrigins = self.waves.map { [$0.source.node.position.x, $0.source.node.position.y] }
                let squaredDistances = waveOrigins.map { vDSP.distanceSquared($0, oscillatorOrigin) }
                self.oscillators[index].distances = vForce.sqrt(squaredDistances)
            }
        }
    }
    
    private func generateSkyboxAssets() -> CGImage? {
        UIGraphicsBeginImageContext(CGSize(width: 300, height: 600))
        let colors = [UIColor.white.cgColor, CGColor(srgbRed: 0.85, green: 0.85, blue: 0.85, alpha: 1)] as CFArray
        let locations: [CGFloat] = [0, 1]
        guard let context = UIGraphicsGetCurrentContext(),
            let gradient = CGGradient(
                colorsSpace: context.colorSpace,
                colors: colors,
                locations: locations
            ) else { return nil }
        context.drawLinearGradient(
            gradient,
            start: CGPoint(x: 3 * context.height / 4, y: 0),
            end: CGPoint(x: context.height, y: 0),
            options: [.drawsAfterEndLocation, .drawsBeforeStartLocation]
        )
        guard let image = context.makeImage() else { return nil }
        return image
    }
}
