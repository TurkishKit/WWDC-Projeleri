import Foundation

public struct Wave {
    
    // MARK: - Properties
    public var oscillation: Oscillation
    public let λ: Float
    public var c: Float { λ * Float(oscillation.f) }
    
    public static let example = Wave(oscillation: Oscillation.example, c: 0.9)
    
    // MARK: - Life Cycle
    public init(oscillation: Oscillation, λ: Float) {
        self.oscillation = oscillation
        self.λ = λ
    }
    
    public init(oscillation: Oscillation, c: Float) {
        self.init(oscillation: oscillation, λ: c / Float(oscillation.f))
    }
}
