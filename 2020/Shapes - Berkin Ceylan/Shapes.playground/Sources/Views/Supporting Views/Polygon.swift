import SwiftUI

public struct Polygon: Shape {
    
    // MARK: - Properties
    var sides: Double
    var scale: Double
    
    // MARK: - Life Cycle
    init(sides: Double, scale: Double){
        self.sides = sides
        self.scale = scale
    }
    
    public var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(sides, scale)
        }
        
        set {
            sides = newValue.first
            scale = newValue.second
        }
    }
    
    // MARK: - Functions
    public func path(in rect: CGRect) -> Path {
        
        let hipotenus = Double(min(rect.size.width, rect.size.height)) / 2.0 * scale
        let center = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
        let extra: Int = sides != Double(Int(sides)) ? 1 : 0
        var path = Path()
        
        for i in 0..<Int(sides) + extra {
            let angle = (Double(i) * (360.0 / Double(sides))) * (Double.pi / 180)
            let point = CGPoint(x: center.x + CGFloat(cos(angle) * hipotenus), y: center.y + CGFloat(sin(angle) * hipotenus))
            if i == 0 {
                path.move(to: point) // Move to first vertex
            } else {
                path.addLine(to: point) // Draw line to next vertex
            }
        }
        
        path.closeSubpath()
        return path
    }
}
