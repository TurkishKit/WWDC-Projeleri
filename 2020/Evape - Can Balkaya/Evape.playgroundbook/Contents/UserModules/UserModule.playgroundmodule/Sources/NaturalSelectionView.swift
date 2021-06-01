import SwiftUI
import PlaygroundSupport

public struct NaturalSelectionView: View {
    
    // MARK: - Properties
    @State var generations = [Storage().createGeneration(color: UIColor(red: 160/255, green: 125/255, blue: 40/255, alpha: 1), rotationCount: 60, degree: 200)]
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let storage = Storage()

    var targetGeneration: Generation
    
    // MARK: - Life Cycle
    public init(targetGeneration: Generation) {
        self.targetGeneration = targetGeneration
    }
    
    // MARK: - UI Elements
    public var body: some View {
        ZStack {
            Color.mainBackground
            
            VStack(alignment: .leading, spacing: 30) {
                HStack(spacing: 20) {
                    storage.createElement(generation: targetGeneration, showIndicator: false)
                        .frame(width: 200, height: 200)
                    
                    DescriptionView(text: "The shape type is evolving with natural selection.", isCenter: false)
                        .padding(.trailing, 20)
                }
                .padding(.leading, 20)
                
                ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(self.generations.reversed(), id: \.self) { generation in
                            self.storage.createElement(generation: generation)
                                .frame(width: 200, height: 200)
                                .padding(.leading, 20)
                        }
                    }
                }
            }
            .onReceive(timer) { time in
                let lastGeneration = self.generations.last!
                
                if self.storage.checkEquality(lastGeneration: lastGeneration, targetGeneration: self.targetGeneration) {
                    self.generations.append(self.storage.createGenerationWithNaturalSelection(lastGeneration: lastGeneration, target: self.targetGeneration))
                } else {
                    self.timer.upstream.connect().cancel()
                    
                    var success = NSLocalizedString("### Charming! \nIt is time for isolation!\n\n[**Next Page**](@next)", comment:"Success message")
                    PlaygroundPage.current.assessmentStatus = .pass(message: success)
                }
            }
            .animation(.spring())
        }
    }
}
