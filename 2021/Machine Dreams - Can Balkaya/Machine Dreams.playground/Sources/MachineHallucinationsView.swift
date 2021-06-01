import SwiftUI

public struct MachineHallucinationsView: UIViewControllerRepresentable {
    
    // MARK: - Properties
    let scene: WaveScene

    // MARK: - Life Cycle
    public init(scene: WaveScene) {
        self.scene = scene
    }
    
    // MARK: - Methods
    public func makeUIViewController(context: Context) -> MachineHallucinationsViewController {
        MachineHallucinationsViewController(scene: scene)
    }

    public func updateUIViewController(_ uiViewController: MachineHallucinationsViewController, context: Context) {
        return
    }
    
    public func makeCoordinator() -> () {
        Coordinator()
    }
}
