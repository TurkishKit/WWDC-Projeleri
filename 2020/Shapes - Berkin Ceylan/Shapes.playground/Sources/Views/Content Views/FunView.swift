import SwiftUI

public struct FunView: View {
    
    // MARK: - Properties
    @State var isOn = false
    @State var sides: Int = 0
    @State var showModal = false
    @State var animateText = false
    
    // MARK: - Content View
    public var body: some View {
        
        let shape = shapeData[sides]
        let pageGradient: [UIColor] = [.green, .red]
        
        return ZStack {
            
            // Gradient
            Color.clear.modifier(GradientCreator(from: pageGradient,
                                                 to: pageGradient,
                                                 placement: 1 ))
            
            VStack {
                if animateText {
                    
                    Text("Let's have fun with")
                        .textStyle(size: 20, color: .white, weight: .regular)
                    
                    Text("Geometric Shapes!")
                        .textStyle(size: 44, color: .white, weight: .bold)
                    
                    Polygon(sides: Double(sides), scale: 0.90)
                        .stroke(Color.white, lineWidth: 3)
                        .animation(.easeInOut(duration: 1.5))
                        .layoutPriority(1)
                        .padding(.bottom, 15)
                    VStack {
                        
                        Text("This is")
                            .textStyle(size: 20, color: .white, weight: .regular)
                        
                        Text("\(shape.name)")
                            .textStyle(size: 44, color: .white, weight: .bold)
                    }
                    VStack {
                        Spacer()
                        
                        Text("The \(shape.name) has \(Int(shape.side)) sides.")
                            .textStyle(size: 20, color: .white, weight: .regular)
                        
                        Text("Each side is \(Int(180 - (360/sides))) degrees.")
                            .textStyle(size: 20, color: .white, weight: .regular)
                        
                        Text("The total of the internal angles is \(Int(180 - (360/sides))*Int(sides)).")
                            .textStyle(size: 20, color: .white, weight: .regular)
                        
                        Stepper(value: $sides, in: 2...20) {
                            Text("Side")
                                .textStyle(size: 20, color: .black, weight: .semibold)
                        }.fixedSize()
                            .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
                            .background(Color.white).cornerRadius(10.0)
                    }.padding(.bottom, 5)
                    Spacer()
                    Button(action: { self.showModal = true }) {
                        
                        HStack{
                            Text("Learn More")
                                .textStyle(size: 20, color: .white, weight: .regular)
                            
                            Image(systemName: "chevron.up.circle.fill")
                                .foregroundColor(.white)
                        }
                    }.sheet(isPresented: self.$showModal){
                        ModalView()
                    }
                }
            }.padding(EdgeInsets(top: 30, leading: 0, bottom: 30, trailing: 0))
        }.onAppear {
            
            self.sides = 5
            self.animateText.toggle()
            self.isOn.toggle()
        }
        .transition(.opacity)
        .animation(.linear(duration: 2), value: isOn)
    }
}
