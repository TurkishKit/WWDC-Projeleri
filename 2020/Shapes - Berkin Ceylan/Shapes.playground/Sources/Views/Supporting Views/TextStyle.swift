import SwiftUI

public struct TextStyle: ViewModifier {
    
    // MARK: - Properties
    var size: CGFloat
    var color: Color
    var weight: Font.Weight
    
    // MARK: - Life Cycle
    init(size: CGFloat, color: Color, weight: Font.Weight){
        self.size = size
        self.color = color
        self.weight = weight
    }
    
    // MARK: - Functions
    public func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight, design: .rounded))
            .foregroundColor(color)
    }
}

    // MARK: - Extension
public extension Text {
    func textStyle(size: CGFloat, color: Color, weight: Font.Weight) -> some View {
        self.modifier(TextStyle(size: size, color: color, weight: weight))
    }
}
