import SwiftUI

public struct GradientCreator: AnimatableModifier {
    
    // MARK: - Properties
    let to: [UIColor]
    let from: [UIColor]
    var placement: CGFloat = 0
    
    public var animatableData: CGFloat {
        
        get {
            placement
        }
        set {
            placement = newValue
        }
    }
    
    // MARK: - Life Cycle
    init(from: [UIColor], to: [UIColor], placement: CGFloat){
        self.from = from
        self.to = to
        self.placement = placement
    }
    
    // MARK: - Functions
    public func body(content: Content) -> some View {
        var gradientColors = [Color]()
        
        for i in 0..<from.count {
            gradientColors.append(colorMix(color1: from[i],
                                           color2: to[i],
                                           placement: placement))
        }
        
        return RoundedRectangle(cornerRadius: 0)
            .fill(LinearGradient(gradient: Gradient(colors: gradientColors),
                                 startPoint: UnitPoint(x: 0, y: 0),
                                 endPoint: UnitPoint(x: 1, y: 1)))
            .edgesIgnoringSafeArea(.all)
    }
    
    //A color interpolation between two values.
    public func colorMix(color1: UIColor, color2: UIColor, placement: CGFloat) -> Color {
        
        guard let colorSec1 = color1.cgColor.components else { return Color(color1) }
        guard let colorSec2 = color2.cgColor.components else { return Color(color1) }
        
        let red = (colorSec1[0] + (colorSec2[0] - colorSec1[0]) * placement)
        let green = (colorSec1[1] + (colorSec2[1] - colorSec1[1]) * placement)
        let blue = (colorSec1[2] + (colorSec2[2] - colorSec1[2]) * placement)
        
        return Color(red: Double(red), green: Double(green), blue: Double(blue))
    }
}
