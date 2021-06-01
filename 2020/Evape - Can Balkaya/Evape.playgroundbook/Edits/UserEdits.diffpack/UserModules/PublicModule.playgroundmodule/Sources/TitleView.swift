import SwiftUI

public struct TitleView: View {
    
    // MARK: - Properties
    let text: String
    
    // MARK: - Life Cycle
    public init(text: String) {
        self.text = text
    }
    
    // MARK: - UI Elements
    public var body: some View {
        Text(text)
            .font(.system(size: 50, weight: .bold, design: .rounded))
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.black)
                    .opacity(0.6)
            )
    }
}
