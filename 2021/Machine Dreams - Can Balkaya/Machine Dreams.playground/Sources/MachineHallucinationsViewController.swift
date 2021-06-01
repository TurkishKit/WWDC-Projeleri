import UIKit
import ARKit

public class MachineHallucinationsViewController: UIViewController {

    // MARK: - UI Elements
    //The sceneview that we are going to display.
    lazy var cameraSceneView = ARSCNView(frame: UIScreen.main.bounds)
    lazy var resultSceneView: SCNView = {
        let _sceneView = SCNView()
        _sceneView.scene = scene
        _sceneView.autoenablesDefaultLighting = true
        _sceneView.allowsCameraControl = true
        _sceneView.rendersContinuously = true
        
        return _sceneView
    }()
    
    // MARK: - Properties
    //The scene node containing the emotion text.
    var textNode: SCNNode? = nil
    var scene: WaveScene

    // MARK: - Life Cycle
    public init(scene: WaveScene) {
        self.scene = scene
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        guard ARWorldTrackingConfiguration.isSupported else { return }

        view.addSubview(cameraSceneView)
        cameraSceneView.delegate = self
        cameraSceneView.showsStatistics = true
        cameraSceneView.session.run(ARFaceTrackingConfiguration(), options: [.resetTracking, .removeExistingAnchors])
        
        cameraSceneView.translatesAutoresizingMaskIntoConstraints = false
        cameraSceneView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cameraSceneView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        cameraSceneView.heightAnchor.constraint(equalToConstant: view.frame.height - 250).isActive = true
        
        setUpSceneView()
    }
    
    public func setUpSceneView() {
        view.addSubview(resultSceneView)
        resultSceneView.translatesAutoresizingMaskIntoConstraints = false
        resultSceneView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resultSceneView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        resultSceneView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        resultSceneView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        resultSceneView.delegate = self
    }

    /// Creates a scene node containing yellow coloured text.
    /// - Parameter faceGeometry: the geometry the node is using.
    public func addTextNode(faceGeometry: ARSCNFaceGeometry) {
        let text = SCNText(string: "", extrusionDepth: 1)
        text.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.systemYellow
        text.materials = [material]

        let textNode = SCNNode(geometry: faceGeometry)
        textNode.position = SCNVector3(-0.1, 0.3, -0.5)
        textNode.scale = SCNVector3(0.003, 0.003, 0.003)
        textNode.geometry = text
        self.textNode = textNode
        cameraSceneView.scene.rootNode.addChildNode(textNode)
    }
}

extension MachineHallucinationsViewController: ARSCNViewDelegate {
    public func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        guard let device = cameraSceneView.device else { return nil }
        let node = SCNNode(geometry: ARSCNFaceGeometry(device: device))
        // Projects the white lines on the face.
        node.geometry?.firstMaterial?.fillMode = .lines
        return node
    }

    public func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        guard let faceGeometry = node.geometry as? ARSCNFaceGeometry, textNode == nil else { return }
        addTextNode(faceGeometry: faceGeometry)
    }

    public func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let faceAnchor = anchor as? ARFaceAnchor,
            let faceGeometry = node.geometry as? ARSCNFaceGeometry,
            let pixelBuffer = self.cameraSceneView.session.currentFrame?.capturedImage
            else {
            return
        }

        //Updates the face geometry.
        faceGeometry.update(from: faceAnchor.geometry)

        let classificator: EmotionClassificator = {
            do {
                let config = MLModelConfiguration()
                return try EmotionClassificator(configuration: config)
            } catch {
                fatalError(error.localizedDescription)
            }
        }()
        
        //Creates Vision Image Request Handler using the current frame and performs an MLRequest.
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: .right, options: [:]).perform([VNCoreMLRequest(model: try! VNCoreMLModel(for: classificator.model)) { [weak self] request, error in
                // Here we get the first result of the Classification Observation result.
                guard let firstResult = (request.results as? [VNClassificationObservation])?.first else { return }
                DispatchQueue.main.async {
                    //Check if the confidence is high enough - used an arbitrary value here - and update the text to display the resulted emotion.

                    (self?.textNode?.geometry as? SCNText)?.string = firstResult.identifier
                    self!.scene.updateElongations()
                    self!.scene.changeWave(for: firstResult.identifier)
                }
            }
        ])
    }
}
