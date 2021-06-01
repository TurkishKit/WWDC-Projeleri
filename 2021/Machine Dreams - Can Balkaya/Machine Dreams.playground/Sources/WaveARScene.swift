#if canImport(ARKit)
import SwiftUI
import SceneKit
import ARKit

public class WaveARScene: WaveScene {
    
    // MARK: - UI Elements
    lazy public var trackingIndicator: SCNNode = {
        let geometry = SCNPlane(width: 0.1, height: 0.1)
        geometry.materials.first?.diffuse.contents = UIImage(named: "tracing-indicator.jpg")
        let _trackingIndicator = SCNNode()
        _trackingIndicator.geometry = geometry
        _trackingIndicator.eulerAngles.x = -0.5 * .pi
        return _trackingIndicator
    }()
    
    // MARK: - Life Cycle
    override public init(sceneCase: WaveScene.SceneCase, selectedImages: [UIImage]? = nil, centerDistance: Float, radius: CGFloat) {
        super.init(sceneCase: sceneCase, selectedImages: selectedImages, centerDistance: centerDistance, radius: radius)
        
        let amount = 71
        generateOscillators(xAmount: amount, yAmount: amount, centerDistance: centerDistance, radius: radius)
    }
    
    required public init?(coder: NSCoder) {
        fatalError(coder.error!.localizedDescription)
    }
    
    // MARK: - Methods
    public func placeContent(at worldPosition: SCNVector3, viewingFrom cameraTransform: SCNMatrix4, cameraAngle: Float) {
        contentNode.worldPosition = worldPosition
        contentNode.worldPosition.y = cameraTransform.m42 + 2
        contentNode.eulerAngles.y = cameraAngle
        rootNode.addChildNode(contentNode)
    }
}
#endif
