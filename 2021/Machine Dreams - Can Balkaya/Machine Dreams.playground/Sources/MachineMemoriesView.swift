import SwiftUI

public struct MachineMemoriesView: View {
    
    // MARK: - Properties
    let images = [UIImage(named: "Memory-Photos/apple-park.jpg")!, UIImage(named: "Memory-Photos/spring-loaded-event-logo.jpg")!, UIImage(named: "Memory-Photos/dogecoin.jpg")!]
    let wave: Wave
    let centerDistance: Float = 0.03
    let radius: CGFloat = 0.03
    var scene: WaveScene {
        WaveScene(
            sceneCase: .machineMemories,
            selectedImages: images,
            centerDistance: centerDistance,
            radius: radius
        )
    }
    
    // MARK: - Life Cycle
    public init(wave: Wave) {
        self.wave = wave
    }
    
    // MARK: - View
    public var body: some View {
        VStack {
            Wave3DSceneView(scene: scene)
            
            #if canImport(ARKit)
            ARButton(action: {
                FullscreenPresenter.shared.present(
                    WaveARSceneViewController(
                        scene: WaveARScene(
                            sceneCase: .machineMemories,
                            selectedImages: images,
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
