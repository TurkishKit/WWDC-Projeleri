import SwiftUI

public struct ThatsItView: View {
    
    // MARK: - Properties
    @State var viewState = CGSize.zero
    
    // MARK: - Life Cycle
    public init() {}
    
    // MARK: - UI Elements
    public var body: some View {
        ZStack {
            Color.mainBackground
            
            EmitterView(position: .constant(CGPoint(x: viewState.width, y: viewState.height)))
                .gesture(
                    DragGesture().onChanged({ value in
                        self.viewState = value.translation
                    }
                )
            )
            
            VStack(spacing: 20) {
                TitleView(text: "That's It!")
                DescriptionView(text: "The playground is finished. Hopefully, you've understood what evolution is and how evolution works.\nThank you for your interest!", isCenter: true)
            }
            .padding()
        }
    }
}
