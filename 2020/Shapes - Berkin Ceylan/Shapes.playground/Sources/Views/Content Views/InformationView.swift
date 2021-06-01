import SwiftUI
import PlaygroundSupport

public struct InformationView: View {
    
    // MARK: - Properties
    @State var isStart = true
    @State var isAnimationOn = true
    @State var currentShapeIndex = 0
    @State var isAnimateElements = false
    @State var isAnimateGradients = false
    
    // MARK: - Content View
    public var body: some View {
        
        // Crate shape object
        let shape = shapeData[Int(currentShapeIndex)]
        
        return ZStack {
            
            // Gradient
            Color.clear.modifier(GradientCreator(from: [.green, .red],
                                                 to: [.cyan, .purple],
                                                 placement: isAnimateGradients ? 0 : 1 ))
            
            VStack (alignment: .center){
                if isAnimateElements {
                    VStack {
                        
                        Text("Meet")
                            .textStyle(size: 20, color: .white, weight: .regular)
                        
                        Text("\(shape.name)")
                            .textStyle(size: 44, color: .white, weight: .bold)
                            .animation(.none)
                    }.padding(.top, 60)
                    ZStack{
                        
                        Polygon(sides: Double(isAnimationOn ? 1 : currentShapeIndex), scale: 0.85)
                            .stroke(Color.white, lineWidth: 3)
                            .padding(40)
                            .padding(.horizontal, 10)
                            .animation(.easeInOut(duration: 2))
                        
                        if currentShapeIndex < 2 {
                            HStack(spacing: 340){
                                if !isStart {
                                    
                                    Text(".")
                                        .textStyle(size: 30, color: .white, weight: .bold)
                                }
                                
                                Text(".")
                                    .textStyle(size: 30, color: .white, weight: .bold)
                            }.padding(.bottom, 20)
                        }
                    }
                    VStack {
                        
                        Text("\(shape.description!)")
                            .textStyle(size: 20, color: .white, weight: .bold)
                            .animation(.none)
                        
                        Text("\(shape.subDescription!)")
                            .textStyle(size: 18, color: .white, weight: .regular)
                            .animation(.none)
                        
                        Button(action: {
                            if self.currentShapeIndex==3 {
                                withAnimation(.easeInOut(duration: 2.5)) {
                                    
                                    self.isAnimateGradients.toggle()
                                    self.isAnimateElements.toggle()
                                    let seconds = 3.0
                                    
                                    // Go to next page
                                    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                                        PlaygroundPage.current.liveView = PlaygroundView.funView
                                    }
                                }
                            }else{
                                
                                // Provides transition to other information that needs to be learned
                                withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 50)) {
                                    if self.isStart {
                                        self.isStart.toggle()
                                    }
                                    self.currentShapeIndex+=1
                                }
                            }
                        }) {
                            ButtonView(text: "Next")
                        }.padding(20)
                    }.padding(.bottom, 20).transition(.opacity)
                }
            }.onAppear {
                
                self.isAnimateElements.toggle()
                self.isAnimationOn.toggle()
            }
        }.transition(.opacity).animation(.easeInOut(duration: 3),value: isAnimationOn)
    }
}
