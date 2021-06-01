import SwiftUI

struct ButtonBackground<S: Shape>: View {
    
    // MARK: - Properties
    var isHighlighted: Bool
    var shape: S
    
    // MARK: - UI Elements
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(Color.highlightBackground)
            } else {
                shape
                    .fill(Color.cardBackground)
            }
        }
    }
}
