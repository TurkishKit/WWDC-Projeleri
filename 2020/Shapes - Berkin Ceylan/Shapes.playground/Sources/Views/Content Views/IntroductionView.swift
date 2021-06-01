import SwiftUI
import PlaygroundSupport

public struct IntroductionView: View {
    
    // MARK: - Properties
    @State var isAnimationOn = false
    @State var animateElements = true
    @State var animateGradients = false
    
    // MARK: - Content View
    public var body: some View {
        ZStack {
            
            // Gradient
            Color.clear.modifier(GradientCreator(from: [.cyan, .purple],
                                                 to: [.red, .yellow],
                                                 placement: animateGradients ? 1 : 0 ))
            
            VStack {
                if animateElements {
                    Spacer()
                    VStack {
                        
                        Text("Shapes")
                            .textStyle(size: 44, color: .white, weight: .bold)
                        
                        Text("WWDC20")
                            .textStyle(size: 20, color: .white, weight: .medium)
                    }.padding(40)
                    
                    Polygon(sides: isAnimationOn ? 5 : 0, scale: isAnimationOn ? 0.85 : 1)
                        .stroke(Color.white, lineWidth: 3)
                        .padding(20)
                        .animation(.easeInOut(duration: 3.0))
                    VStack {
                        
                        Text("Hello!")
                            .textStyle(size: 44, color: .white, weight: .bold)
                        
                        Text("Do you want to explore geometry?")
                            .textStyle(size: 20, color: .white, weight: .regular)
                        
                        Text("with a 😎 way.")
                            .textStyle(size: 20, color: .white, weight: .regular)
                    }
                    
                    Button(action: {
                        withAnimation(.easeInOut(duration: 2.5)) {
                            self.animateGradients.toggle()
                            self.isAnimationOn.toggle()
                            self.animateElements.toggle()
                            
                            // Go to next page
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                PlaygroundPage.current.liveView = PlaygroundView.informationView
                            }
                        }
                    }) {
                        ButtonView(text: "Let's Start")
                    }
                }
            }.padding(.bottom, 40)
        }.onAppear{
            
            self.isAnimationOn.toggle()
            self.animateGradients.toggle()
        }
    }
}
