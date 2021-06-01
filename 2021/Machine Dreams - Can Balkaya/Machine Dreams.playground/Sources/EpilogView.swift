import SwiftUI

public struct EpilogView: View {
    
    // MARK: - Properties
    @State var viewState = CGSize.zero
    
    // MARK: - Life Cycle
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
                TitleView(text: "Epilog")
                DescriptionView(text: "I hope this playground exhibition has inspired you about artificial intelligence and space. Thank you.")
            }
            .frame(width: 350)
        }
        .edgesIgnoringSafeArea(.all)
    }
}
