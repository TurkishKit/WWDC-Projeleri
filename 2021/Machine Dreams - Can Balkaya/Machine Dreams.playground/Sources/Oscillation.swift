import Foundation
import CoreGraphics

public struct Oscillation {
    
    // MARK: - Properties
    var ŷ: CGFloat
    var f: TimeInterval
    var T: TimeInterval { 1/f }
    var ω: TimeInterval { 2 * Double.pi * f }
    var φ₀: Double = 0
    var v̂: CGFloat { ŷ * CGFloat(ω) }
    var â: CGFloat { ŷ * pow(CGFloat(ω), 2) }
    
    public static let example = Oscillation(ŷ: 0.3, f: 0.6)
    
    // MARK: - Life Cycle
    public init(ŷ: CGFloat, f: TimeInterval) {
        self.ŷ = ŷ
        self.f = f
    }
    
    public init(ŷ: CGFloat, T: TimeInterval) {
        self.init(ŷ: ŷ, f: 1 / T)
    }
    
    public init(ŷ: CGFloat, ω: TimeInterval) {
        self.init(ŷ: ŷ, f: ω / (2 * Double.pi))
    }
    
    // MARK: - Methods
    public func y(_ t: Double) -> CGFloat {
        ŷ * CGFloat(sin(ω * t + φ₀))
    }
    
    public func v(_ t: Double) -> CGFloat {
        ŷ * CGFloat(ω * cos(ω * t + φ₀))
    }
    
    public func a(_ t: Double) -> CGFloat {
        -ŷ * CGFloat(pow(ω, 2)*sin(ω * t + φ₀))
    }
}
