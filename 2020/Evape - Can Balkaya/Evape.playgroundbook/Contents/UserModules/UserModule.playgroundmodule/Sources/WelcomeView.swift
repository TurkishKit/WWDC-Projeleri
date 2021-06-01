import SwiftUI
import PlaygroundSupport

public struct WelcomeView: View {
    
    // MARK: - Properties
    @State var viewState = CGSize.zero
    
    // MARK: - Life Cycle
    public init() {}
    
    // MARK: - UI Elements
    public var body: some View {
        ZStack {
            Color.mainBackground
            
            WelcomeEmitterView(position: .constant(CGPoint(x: viewState.width, y: viewState.height)))
                .gesture(
                    DragGesture().onChanged({ value in
                        self.viewState = value.translation
                    }
                )
            )
            
            VStack(spacing: 20) {
                TitleView(text: "Welcome!")
                DescriptionView(text: "In this playground, we will learn what is evolution and how evolution works. We will do this with the shapes that appear on the screen. Let's start, if you're ready! ✌️", isCenter: true)
            }
            .padding()
        }
    }
}
