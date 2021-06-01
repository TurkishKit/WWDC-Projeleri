import SwiftUI

public struct AIDataSculptureView: View {
    
    // MARK: - Properties
    let wave: Wave
    let centerDistance: Float = 0.03
    let radius: CGFloat = 0.03
    
    // MARK: - Life Cycle
    public init(wave: Wave) {
        self.wave = wave
    }
    
    // MARK: - View
    public var body: some View {
        VStack {
            Wave3DSceneView(scene: WaveScene(
                sceneCase: .aiDataSculpture,
                centerDistance: centerDistance,
                radius: radius
            ))
            
            #if canImport(ARKit)
            ARButton(action: {
                FullscreenPresenter.shared.present(
                    WaveARSceneViewController(
                        scene:
                            WaveARScene(
                                sceneCase: .aiDataSculpture,
                                centerDistance: self.centerDistance,
                                radius: self.radius
                            ),
                        wave: wave
                    )
                )
            })
            #endif
        }
        .padding(.vertical)
        .accentColor(.red)
    }
}
