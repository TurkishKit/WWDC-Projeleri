import Foundation

public struct Wave3D {
    
    // MARK: - Properties
    let source: Oscillator3D
    let model: Wave
    let t₀: TimeInterval
    
    // MARK: - Life Cycle
    public init(source: Oscillator3D, model: Wave, t₀: TimeInterval) {
        self.source = source
        self.model = model
        self.t₀ = t₀
    }
}
