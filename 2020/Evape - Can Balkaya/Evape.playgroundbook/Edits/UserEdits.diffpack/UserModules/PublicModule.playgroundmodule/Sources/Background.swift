import SwiftUI

struct Background: View {
    
    // MARK: - Properties
    let generation: Generation
    let showIndicator: Bool
    
    // MARK: - UI Elements
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                RoundedRectangle(cornerRadius: geometry.size.width / 10)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .foregroundColor(Color.cardBackground)
                
                if self.showIndicator {
                    Text(String(self.generation.number))
                        .foregroundColor(Color.cardBackground)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .animation(.linear)
                        .padding(5)
                        .fixedSize()
                        .background(
                            RoundedRectangle(cornerRadius: geometry.size.width / 20)
                                .fill(Color.indicatorBackground)
                        )
                        .offset(x: 0, y: 0)
                        .padding(10)
                }
            }
        }
    }
}
