import SceneKit

public struct Oscillator3D: Equatable {
    
    // MARK: - Properties
    var location: (x: CGFloat, y: CGFloat) = (x: 0, y: 0)
    let node: SCNNode
    var distances = [Float]()
    
    // MARK: - Life Cycle
    public init(node: SCNNode) {
        self.node = node
    }
    
    // MARK: - Methods
    public static func == (lhs: Oscillator3D, rhs: Oscillator3D) -> Bool {
        lhs.location.x == rhs.location.x && lhs.location.y == rhs.location.y
    }
}
