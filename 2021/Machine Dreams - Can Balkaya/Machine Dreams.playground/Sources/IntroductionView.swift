import SwiftUI

public struct IntroductionView: View {
    
    // MARK: - Properties
    @State var viewState = CGSize.zero
    
    public init() {}
    
    // MARK: - View
    public var body: some View {
        ZStack {
            Color.black
            
            EmitterView(position: .constant(CGPoint(x: viewState.width, y: viewState.height)))
                .gesture(
                    DragGesture().onChanged { value in
                        self.viewState = value.translation
                    }
                )
            
            VStack(spacing: 20) {
                TitleView(text: "Introduction")
                DescriptionView(text: "In this playground exhibition, you can see the dreams of the machines and learn how the images you're seeing on this screen are created.")
            }
            .frame(width: 350)
        }
        .edgesIgnoringSafeArea(.all)
    }
}
