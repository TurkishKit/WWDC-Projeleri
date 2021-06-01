import SwiftUI
import ARKit

#if canImport(ARKit)
public class WaveARSceneViewController: UIViewController, ARSCNViewDelegate {
    
    // MARK: - UI Elements
    lazy var arView: ARSCNView = {
        let _arView = ARSCNView()
        _arView.scene = scene
        _arView.autoenablesDefaultLighting = true
        _arView.rendersContinuously = true
        let tapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(handleTap(_:))
        )
        tapGestureRecognizer.numberOfTapsRequired = 1
        _arView.addGestureRecognizer(tapGestureRecognizer)
        return _arView
    }()
    
    lazy var coachingView: ARCoachingOverlayView = {
        let _coachingView = ARCoachingOverlayView()
        _coachingView.session = self.arView.session
        return _coachingView
    }()
    
    lazy var backButton: UIButton = {
        let _backButton = UIButton()
        _backButton.tintColor = .white
        _backButton.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .highlighted)
        _backButton.setImage(UIImage(systemName: "escape"), for: .normal)
        _backButton.contentEdgeInsets.left = 5
        _backButton.imageEdgeInsets.left = -5
        _backButton.setTitle("Exit AR", for: .normal)
        return _backButton
    }()
    
    lazy var placeInstructions: UILabel = {
        let _placeInstructions = UILabel()
        _placeInstructions.text = "In an area with sufficient room, tap to place the oscillator plane."
        _placeInstructions.textColor = .white
        _placeInstructions.font = UIFont.preferredFont(forTextStyle: .caption1)
        return _placeInstructions
    }()
    
    // MARK: - Properties
    let scene: WaveARScene
    let wave: Wave
    var isTrackingIndicatorPlaced = false
    var viewCenter = CGPoint()
    var isContentPlaced = false {
        didSet { if isContentPlaced { placeInstructions.isHidden = true } }
    }
    public override var prefersStatusBarHidden: Bool { true }

    // MARK: - Life Cycle
    public init(scene: WaveARScene, wave: Wave) {
        self.scene = scene
        self.wave = wave
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Stop! You're not supposed to initialize this way, smh...")
    }
    
    // MARK: - Life Cycle
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(arView)
        arView.delegate = self
        arView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            arView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            arView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            arView.topAnchor.constraint(equalTo: view.topAnchor),
            arView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        view.addSubview(coachingView)
        coachingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            coachingView.widthAnchor.constraint(equalTo: view.widthAnchor),
            coachingView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 24),
            backButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 12)
        ])
        
        view.addSubview(placeInstructions)
        placeInstructions.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            placeInstructions.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            placeInstructions.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -12)
        ])
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let arConfig = ARWorldTrackingConfiguration()
        arView.session.run(arConfig)
    }
    
    override public func viewDidLayoutSubviews() {
        viewCenter = view.center
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        arView.session.pause()
    }
    
    // MARK: - Methods
    public func getViewportCenterInWorld() -> SCNVector3? {
        guard let hitResult = arView.hitTest(viewCenter, types: [.existingPlaneUsingGeometry, .existingPlaneUsingExtent, .estimatedHorizontalPlane]).first else { return nil }
        let viewportCenterWorldTransform = SCNMatrix4(hitResult.worldTransform)
        return SCNVector3(viewportCenterWorldTransform.m41, viewportCenterWorldTransform.m42, viewportCenterWorldTransform.m43)
    }
    
    @objc func exit() {
        FullscreenPresenter.shared.dismiss()
    }
    
    @objc public func handleTap(_ tap: UITapGestureRecognizer) {
        if !isContentPlaced {
            guard let centerPosition = getViewportCenterInWorld(),
                let camera = arView.session.currentFrame?.camera else { return }
            let cameraPerspective = SCNMatrix4(camera.transform)
            let angle = camera.eulerAngles.z
            scene.placeContent(at: centerPosition, viewingFrom: cameraPerspective, cameraAngle: angle)
            isContentPlaced = true
            scene.trackingIndicator.removeFromParentNode()
            isTrackingIndicatorPlaced = false
            return
        }
        // Add waves.
        let location = tap.location(in: arView)
        let hitResults = arView.hitTest(
            location,
            options: [
                SCNHitTestOption.boundingBoxOnly: true
            ]
        )
        if let _ = hitResults.first?.node {
            scene.addWave(wave: self.wave)
        }
    }
    
    public func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        scene.currentTime = time
        
        if !isContentPlaced {
            guard let centerPosition = getViewportCenterInWorld() else { return }
            scene.trackingIndicator.position = centerPosition
            if !isTrackingIndicatorPlaced { scene.rootNode.addChildNode(scene.trackingIndicator) }
            return
        }
        
        scene.updateElongations()
    }
}
#endif
