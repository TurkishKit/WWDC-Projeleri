import SwiftUI

public struct TitleView: View {
    
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
                .bold()
                .multilineTextAlignment(.center)
                .font(.title)
                .padding(.vertical, 8)
            
            Spacer()
        }
        .background(
            ContainerRelativeShape()
                .stroke(Color.white)
                .background(Color.black.opacity(0.5).blur(radius: 1))
        )
    }
}
