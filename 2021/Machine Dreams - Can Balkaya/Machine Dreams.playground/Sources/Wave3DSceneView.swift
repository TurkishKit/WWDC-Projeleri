import SwiftUI

public struct Wave3DSceneView: UIViewControllerRepresentable {
    
    // MARK: - Properties
    let scene: WaveScene

    // MARK: - Life Cycle
    public init(scene: WaveScene) {
        self.scene = scene
    }
    
    // MARK: - Methods
    public func makeUIViewController(context: Context) -> Wave3DSceneViewController {
        Wave3DSceneViewController(scene: scene)
    }
    
    public func updateUIViewController(_ uiViewController: Wave3DSceneViewController, context: Context) { return }
    
    public func makeCoordinator() -> () {
        Coordinator()
    }
}
