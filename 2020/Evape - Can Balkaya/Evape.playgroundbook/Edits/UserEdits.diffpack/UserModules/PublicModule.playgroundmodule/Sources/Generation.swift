import SwiftUI

public struct Generation: Hashable {
    
    // MARK: - Properties
    public var number: Int
    public let color: UIColor
    public let cornerRadius: CGFloat
    public var rotationCount: Int
    public let opacity: Double
    public let degree: Double
    public var isSelectable: Bool
    public var placement: Int
    public var heightConstant: CGFloat
    public var spacingConstant: CGFloat
    public var middleConstant: CGFloat
    public var topWidthConstant: CGFloat
    public var topHeightConstant: CGFloat
    public var yAxisConstant: CGFloat
    
    // MARK: - Life Cycle
    public init(number: Int, color: UIColor, cornerRadius: CGFloat, rotationCount: Int, opacity: Double, degree: Double, isSelectable: Bool, placement: Int, heightConstant: CGFloat, spacingConstant: CGFloat, middleConstant: CGFloat, topWidthConstant: CGFloat, topHeightConstant: CGFloat, yAxisConstant: CGFloat) {
        self.number = number
        self.color = color
        self.cornerRadius = cornerRadius
        self.rotationCount = rotationCount
        self.opacity = opacity
        self.degree = degree
        self.isSelectable = isSelectable
        self.placement = placement
        self.heightConstant = heightConstant
        self.spacingConstant = spacingConstant
        self.middleConstant = middleConstant
        self.topWidthConstant = topWidthConstant
        self.topHeightConstant = topHeightConstant
        self.yAxisConstant = yAxisConstant
    }
}
