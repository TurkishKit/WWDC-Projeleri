import SwiftUI

public struct EvolutionView: View {
    
    // MARK: - Properties
    private let screenWidth = UIScreen.main.bounds.width
    let storage = Storage()
    
    // MARK: - Life Cycle
    public init() {}
    
    // MARK: - UI Elements
    public var body: some View {
        ZStack {
            Color.mainBackground
            
            VStack(spacing: 20) {
                DescriptionView(text: "This is an example of shape evolution proccess.", isCenter: true)
                    .padding()
                
                ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(1...50, id: \.self) { number in
                            self.storage.createElement(generation: self.storage.createGeneration(number: number, color: UIColor(red: (56 + CGFloat(number)) / 255, green: (197 + CGFloat(number)) / 255, blue: (255 + CGFloat(number)) / 255, alpha: 1), degree: 10 + Double(number)))
                                .padding(.leading, 20)
                        }
                        .id(UUID())
                    }
                }
                .frame(height: 200)
            
                HStack {
                    Text("Scroll")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                    
                    Image(systemName: "arrow.right")
                        .font(.system(size: 30, weight: .heavy, design: .rounded))
                }
                .foregroundColor(.white)
            }
            .padding(.bottom, 100)
        }
    }
}
