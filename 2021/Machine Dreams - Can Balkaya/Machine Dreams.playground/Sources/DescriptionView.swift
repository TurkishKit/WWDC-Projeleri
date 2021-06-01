import SwiftUI

public struct DescriptionView: View {
    
    // MARK: - Properties
    let text: String
    
    // MARK: - Life Cycle
    public init(text: String) {
        self.text = text
    }
    
    // MARK: - View
    public var body: some View {
        HStack {
            Spacer()
            
            Text(text)
                .foregroundColor(.white)
                .font(.headline)
                .multilineTextAlignment(.center)
            
            Spacer()
        }
        .padding()
        .background(
            ContainerRelativeShape()
                .stroke(Color.white)
                .background(Color.black.opacity(0.5).blur(radius: 1))
        )
    }
}
