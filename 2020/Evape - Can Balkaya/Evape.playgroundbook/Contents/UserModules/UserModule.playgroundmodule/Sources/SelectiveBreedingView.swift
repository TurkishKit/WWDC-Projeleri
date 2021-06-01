import SwiftUI
import PlaygroundSupport

public struct SelectiveBreedingView: View {
    
    // MARK: - Properties
    @State var generations = [Storage().createGeneration(color: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), opacity: 0.4, degree: 100)]
    @State var newGenerations = [Generation]()
    @State var isPresented = false
    let storage = Storage()
    private let sizeConstant: CGFloat = 160
    
    // MARK: - Life Cycle
    public init() {}
    
    // MARK: - UI Elements
    public var body: some View {
        ZStack {
            Color.mainBackground
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 25) {
                YearIndicatorView(count: generations.count - 1, text: "\((generations.count) * 120) years")
                    .animation(.default)
                
                ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(newGenerations, id: \.self) { generation in
                            self.storage.createElement(generation: generation, showIndicator: false)
                                .frame(width: 160, height: 160)
                                .onTapGesture {
                                    self.generations.append(generation)
                                    self.newGenerations.removeAll()
                                }
                                .padding([.leading, .trailing], 10)
                        }
                        .id(UUID())
                    }
                    .padding(.leading, 6)
                }
                .disabled(newGenerations.isEmpty)
                .frame(height: 160)
                
                ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        Button(action: {
                            let lastGeneration = self.generations.last!
                            self.newGenerations = self.storage.createGenerationsWithMutation(lastGeneration: lastGeneration)
                        }) {
                            Image(systemName: newGenerations.isEmpty ? "plus" : "arrow.clockwise")
                                .font(.system(size: 70, weight: .heavy, design: .rounded))
                                .foregroundColor(Color.white)
                                .frame(width: self.sizeConstant, height: self.sizeConstant)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.cardBackground)
                                        .frame(width: self.sizeConstant, height: self.sizeConstant)
                                )
                        }
                        .frame(width: self.sizeConstant, height: self.sizeConstant)
                        .padding(.leading, 16)
                        .padding(.trailing, 10)
                        
                        ForEach(generations.reversed(), id: \.self) { generation in
                            self.storage.createElement(generation: generation, showIndicator: true)
                                .frame(width: self.sizeConstant, height: self.sizeConstant)
                                .padding([.leading, .trailing], 10)
                        }
                        .id(UUID())
                    }
                }
                .frame(height: self.sizeConstant)
                    
                Button(action: {
                    self.isPresented = true
                    
                    var success = NSLocalizedString("### Amazing! \nYou've created shapes with selective breeding! You can go to the last page.\n\n[**Next Page**](@next)", comment:"Success message")
                    PlaygroundPage.current.assessmentStatus = .pass(message: success)
                }) {
                    Text("Preview")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .semibold, design: .rounded))
                        .padding(12)
                }
                .disabled(!newGenerations.isEmpty)
                .opacity(!newGenerations.isEmpty ? 0.4 : 1)
                .buttonStyle(ButtonsStyle())
                
                if self.generations.count == 1 && self.newGenerations.count == 0{
                    DescriptionView(text: "Press the '+' button to view the new generations.", isCenter: true)
                }
            }
        }
        .animation(.default)
        .sheet(isPresented: $isPresented) { ResultView(generations: self.generations) }
    }
}
