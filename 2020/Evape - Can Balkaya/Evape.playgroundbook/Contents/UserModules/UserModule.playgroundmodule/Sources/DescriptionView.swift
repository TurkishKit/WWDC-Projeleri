import SwiftUI

public struct DescriptionView: View {
    
    // MARK: - Properties
    let text: String
    let isCenter: Bool
    
    // MARK: - Life Cycle
    public init(text: String, isCenter: Bool) {
        self.text = text
        self.isCenter = isCenter
    }
    
    // MARK: - UI Elements
    public var body: some View {
        Text(text)
            .font(.system(size: 25, weight: .regular, design: .rounded))
            .multilineTextAlignment(self.isCenter ? .center : .leading)
            .foregroundColor(.white)
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.black)
                    .opacity(0.6)
            )
    }
}
