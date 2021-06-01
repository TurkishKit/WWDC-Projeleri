import SwiftUI

#if canImport(ARKit)
public struct WaveARSceneView: UIViewControllerRepresentable {
    
    // MARK: - Properties
    let scene: WaveARScene
    let wave: Wave

    public init(scene: WaveARScene, wave: Wave) {
        self.scene = scene
        self.wave = wave
    }
    
    // MARK: - Methods
    public func makeUIViewController(context: Context) -> WaveARSceneViewController {
        WaveARSceneViewController(scene: scene, wave: wave)
    }

    public func updateUIViewController(_ uiViewController: WaveARSceneViewController, context: Context) {
        return
    }
    
    public func makeCoordinator() -> () {
        Coordinator()
    }
}
#endif
