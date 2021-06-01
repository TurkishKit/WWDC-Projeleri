import SwiftUI
import SceneKit

public class Wave3DSceneViewController: UIViewController, SCNSceneRendererDelegate {
    
    // MARK: - UI Elements
    lazy var sceneView: SCNView = {
        let _sceneView = SCNView()
        _sceneView.scene = scene
        _sceneView.autoenablesDefaultLighting = true
        _sceneView.allowsCameraControl = true
        _sceneView.rendersContinuously = true
        
        return _sceneView
    }()
    
    // MARK: - Properties
    let scene: WaveScene
    
    // MARK: - Life Cycle
    public init(scene: WaveScene) {
        self.scene = scene
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("Stop! You're not supposed to initialize this way, smh...")
    }
    
    // MARK: - Methods
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        view = sceneView
        sceneView.delegate = self
    }
    
    public func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        scene.currentTime = time
        scene.updateElongations()
    }
}
