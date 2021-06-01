import SwiftUI

extension Color {
    
    // MARK: - Properties
    static public let mainBackground = Color(red: 36/255, green: 36/255, blue: 36/255)
    static public let cardBackground = Color(red: 74/255, green: 74/255, blue: 74/255)
    static public let highlightBackground = Color(red: 145/255, green: 145/255, blue: 145/255)
    static public let indicatorBackground = Color(red: 216/255, green: 216/255, blue: 216/255)
}

extension UIColor {
    
    // MARK: - Properties
    public var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }
    
    // MARK: - Functions
    public class func addRandomColor(color: UIColor) -> UIColor {
        let r = color.rgba.red + .random(in: -0.08...0.08)
        let g = color.rgba.green + .random(in: -0.08...0.08)
        let b = color.rgba.blue + .random(in: -0.08...0.08)
        
        let newColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        return newColor
    }
}
