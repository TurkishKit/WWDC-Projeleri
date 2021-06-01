import SwiftUI

struct ElementSymbol: View {
    
    // MARK: - Properties
    let generation: Generation

    // MARK: - UI Elements
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * self.generation.heightConstant
                let spacing = width * self.generation.spacingConstant
                let middle = width / self.generation.middleConstant
                let topWidth = self.generation.topWidthConstant * width
                let topHeight = self.generation.topHeightConstant * height
                
                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: topHeight / self.generation.yAxisConstant + spacing),
                    CGPoint(x: middle + topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: spacing)
                ])
                
                path.move(to: CGPoint(x: middle, y: topHeight / self.generation.yAxisConstant + spacing * 3))
                
                path.addLines([
                    CGPoint(x: middle - topWidth, y: topHeight + spacing),
                    CGPoint(x: spacing, y: height - spacing),
                    CGPoint(x: width - spacing, y: height - spacing),
                    CGPoint(x: middle + topWidth, y: topHeight + spacing),
                    CGPoint(x: middle, y: topHeight / self.generation.yAxisConstant + spacing * 3)
                ])
            }
            .fill(Color(self.generation.color))
            .cornerRadius(self.generation.cornerRadius)
        }
    }
}
