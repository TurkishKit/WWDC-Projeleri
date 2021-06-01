import SwiftUI
import PlaygroundSupport

public struct IsolationView: View {
    
    // MARK: - Properties
    @State var firstGenerations = [Storage().createGeneration()]
    @State var secondGenerations = [Storage().createGeneration()]
    @State var count = 0
    @State var differentPlace = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let storage = Storage()
    private let sizeConstant: CGFloat = 190
    
    // MARK: - Life Cycle
    public init() {}
    
    // MARK: - UI Elements
    public var body: some View {
        ZStack {
            Color.mainBackground
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                DescriptionView(text: "If you touch the button, you will cut the connection between the shapes. Thus, the shapes will differ from each other.", isCenter: true)
                    .padding()
                
                ZStack {
                    HStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.indicatorBackground)
                            .frame(width: self.differentPlace ? 205 : 0, height: 290)
                        
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.highlightBackground)
                            .frame(width: self.differentPlace ? 205 : 410, height: 290)
                    }
                    
                    VStack {
                        HStack(spacing: -50) {
                            PlaceIndicator(text: "A", isA: true)
                                .opacity(self.differentPlace ? 1 : 0)
                                .offset(x: self.differentPlace ? -100 : 0)
                            PlaceIndicator(text: "B", isA: false)
                                .offset(x: self.differentPlace ? 100 : 0)
                        }
                        
                        HStack(spacing: self.differentPlace ? 26 : 12) {
                            ZStack {
                                ForEach(firstGenerations, id: \.self) { generation in
                                    self.storage.createElement(generation: generation)
                                        .frame(width: self.sizeConstant, height: self.sizeConstant)
                                }
                            }
                            
                            ZStack {
                                ForEach(secondGenerations, id: \.self) { generation in
                                    self.storage.createElement(generation: generation)
                                        .frame(width: self.sizeConstant, height: self.sizeConstant)
                                }
                            }
                        }
                        .onReceive(timer) { time in
                            let generations = self.storage.createMultipleGenerations(first: self.firstGenerations, second: self.secondGenerations, self.differentPlace)
                            self.firstGenerations = generations.0
                            self.secondGenerations = generations.1
                            
                            self.count += 1
                            
                            if self.count == 24 {
                                self.timer.upstream.connect().cancel()
                                
                                var success = NSLocalizedString("According to understanding the isolation, artificial selection is next. Be ready!\n\n[**Next Page**](@next)", comment:"Success message")
                                PlaygroundPage.current.assessmentStatus = .pass(message: success)
                            }
                        }
                    }
                }
                
                Button(action: {
                    self.differentPlace.toggle()
                }) {
                    Text("Change")
                        .font(.system(size: 24, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                        .padding(15)
                }
                .buttonStyle(ButtonsStyle())
                
                Spacer()
            }
        }
        .animation(.linear)
    }
}
