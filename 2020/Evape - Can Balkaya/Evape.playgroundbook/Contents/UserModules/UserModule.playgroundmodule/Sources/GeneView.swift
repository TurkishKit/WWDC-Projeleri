import SwiftUI

public struct GeneView: View {
    
    // MARK: - Properties
    let storage = Storage()
    
    let color: UIColor
    let rotationCount: Int
    let opacity: Double
    let degree: Double
    
    // MARK: - Life Cycle
    public init(color: UIColor, rotationCount: Int, opacity: Double, degree: Double) {
        self.color = color
        self.rotationCount = rotationCount
        self.opacity = opacity
        self.degree = degree
    }
    
    // MARK: - UI Elements
    public var body: some View {
        ZStack {
            Color.mainBackground
            
            VStack(spacing: 20) {
                DescriptionView(text: "You can change the shape by changing the genes on the left. 👈", isCenter: true)
                    .padding()
                
                storage.createElement(generation: storage.createGeneration(color: self.color, rotationCount: self.rotationCount, opacity: self.opacity, degree: self.degree), showIndicator: false)
                    .frame(width: 250, height: 250)
            }
            .padding(.bottom, 80)
        }
    }
}
