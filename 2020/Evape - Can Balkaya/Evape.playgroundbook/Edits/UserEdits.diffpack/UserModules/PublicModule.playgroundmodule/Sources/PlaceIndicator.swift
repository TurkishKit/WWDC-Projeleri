import SwiftUI

struct PlaceIndicator: View {
    
    // MARK: - Properties
    let text: String
    let isA: Bool
    
    // MARK: - UI Elements
    var body: some View {
        Text(text)
            .font(.system(size: 30, design: .rounded))
            .bold()
            .foregroundColor(isA ? .white : .black)
            .padding()
            .background(Circle().fill(isA ? Color.mainBackground : Color.indicatorBackground))
    }
}
