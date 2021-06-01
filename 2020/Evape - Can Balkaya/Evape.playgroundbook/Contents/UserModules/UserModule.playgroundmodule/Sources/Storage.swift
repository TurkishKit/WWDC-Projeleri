import SwiftUI

public class Storage {
    
    // MARK: - Life Cycle
    public init() {}
    
    // MARK: - Functions
    public func createGenerationWithNaturalSelection(lastGeneration: Generation, target targetGeneration: Generation) -> Generation {
        var generation: Generation
        
        var setColors: UIColor {
            let constant: CGFloat = 5
            var rgb = (CGFloat(), CGFloat(), CGFloat())
            
            let redConstant = lastGeneration.color.rgba.red * 255
            let greenConstant = lastGeneration.color.rgba.green * 255
            let blueConstant = lastGeneration.color.rgba.blue * 255
            
            if lastGeneration.color.rgba.red < targetGeneration.color.rgba.red {
                rgb.0 = redConstant + constant
            } else if lastGeneration.color.rgba.red > targetGeneration.color.rgba.red {
                rgb.0 = redConstant - constant
            } else {
                rgb.0 = redConstant
            }
            
            if lastGeneration.color.rgba.green < targetGeneration.color.rgba.green {
                rgb.1 = greenConstant + constant
            } else if lastGeneration.color.rgba.green > targetGeneration.color.rgba.green {
                rgb.1 = greenConstant - constant
            } else {
                rgb.1 = greenConstant
            }
            
            if lastGeneration.color.rgba.blue < targetGeneration.color.rgba.blue {
                rgb.2 = blueConstant + constant
            } else if lastGeneration.color.rgba.blue > targetGeneration.color.rgba.blue {
                rgb.2 = blueConstant - constant
            } else {
                rgb.2 = blueConstant
            }
            
            return UIColor(red: rgb.0 / 255, green: rgb.1 / 255, blue: rgb.2 / 255, alpha: 1)
        }
        
        var setRotationCount: Int {
            var newRotationCount = Int()
            let constant = 1
            
            if lastGeneration.rotationCount < targetGeneration.rotationCount {
                newRotationCount = lastGeneration.rotationCount + constant
            } else if lastGeneration.rotationCount > targetGeneration.rotationCount {
                newRotationCount = lastGeneration.rotationCount - constant
            } else {
                newRotationCount = lastGeneration.rotationCount
            }
            
            return newRotationCount
        }
        
        var setOpacity: Double {
            var newOpacity = Double()
            let constant = 0.1
            
            if lastGeneration.opacity < targetGeneration.opacity {
                newOpacity = lastGeneration.opacity + constant
            } else if lastGeneration.opacity > targetGeneration.opacity {
                newOpacity = lastGeneration.opacity - constant
            } else {
                newOpacity = lastGeneration.opacity
            }
            
            return newOpacity
        }
        
        var setDegree: Double {
            var newDegree = Double()
            let constant: Double = 10
            
            if lastGeneration.degree < targetGeneration.degree {
                newDegree = lastGeneration.degree + constant
            } else if lastGeneration.degree > targetGeneration.degree {
                newDegree = lastGeneration.degree - constant
            } else {
                newDegree = lastGeneration.degree
            }
            
            return newDegree
        }
        
        generation = createGeneration(number: lastGeneration.number + 1, color: setColors, rotationCount: setRotationCount, opacity: setOpacity, degree: setDegree)
        
        return generation
    }
    
    public func checkEquality(lastGeneration: Generation, targetGeneration: Generation) -> Bool {
        let first = lastGeneration.color == targetGeneration.color
        let second = lastGeneration.rotationCount == targetGeneration.rotationCount
        let third = lastGeneration.opacity == targetGeneration.opacity
        let fourth = lastGeneration.degree == targetGeneration.degree
        
        if first && second && third && fourth {
            return false
        } else {
            return true
        }
    }
    
    public func createMultipleGenerations(first firstGenerations: [Generation], second secondGenerations: [Generation], _ differentPlace: Bool) -> ([Generation], [Generation]) {
        var first = firstGenerations
        var second = secondGenerations
        
        let firstLatestGeneration = firstGenerations.last!
        let secondLatestGeneration = secondGenerations.last!
        
        if differentPlace {
            first.append(Storage().createGeneration(number: firstLatestGeneration.number + 1, color: UIColor(red: firstLatestGeneration.color.rgba.red + 0.02, green: firstLatestGeneration.color.rgba.green + 0.03, blue: firstLatestGeneration.color.rgba.blue + 0.03, alpha: 1), rotationCount: firstLatestGeneration.rotationCount - 1, opacity: firstLatestGeneration.opacity + 0.01, degree: firstLatestGeneration.degree - 1))
        } else {
            first.append(Storage().createGeneration(number: firstLatestGeneration.number + 1, color: UIColor(red: firstLatestGeneration.color.rgba.red + 0.009, green: firstLatestGeneration.color.rgba.green + 0.01, blue: firstLatestGeneration.color.rgba.blue + 0.01, alpha: 1), rotationCount: firstLatestGeneration.rotationCount + 2, opacity: firstLatestGeneration.opacity + 0.005, degree: firstLatestGeneration.degree + 3))
        }
        
        second.append(Storage().createGeneration(number: secondLatestGeneration.number + 1, color: UIColor(red: secondLatestGeneration.color.rgba.red + 0.009, green: secondLatestGeneration.color.rgba.green + 0.01, blue: secondLatestGeneration.color.rgba.blue + 0.01, alpha: 1), rotationCount: secondLatestGeneration.rotationCount + 2, opacity: secondLatestGeneration.opacity + 0.005, degree: secondLatestGeneration.degree + 3))
        
        return (first, second)
    }
    
    public func createElement(generation: Generation, showIndicator: Bool = true) -> Element {
        let element = Element(generation: generation, showIndicator: showIndicator)
        return element
    }
    
    public func createGeneration(number: Int = 1, color: UIColor = UIColor(red: 255/255, green: 228/255, blue: 56/255, alpha: 1), cornerRadius: CGFloat = 5, rotationCount: Int = 20, opacity: Double = 0.3, degree: Double = 50, isSelectable: Bool = false, placement: Int = 1, heightConstant: CGFloat = 0.75, spacingConstant: CGFloat = 0.03, middleConstant: CGFloat = 2, topWidthConstant: CGFloat = 0.226, topHeightConstant: CGFloat = 0.488, yAxisConstant: CGFloat = 2) -> Generation {
        let generation = Generation(number: number, color: color, cornerRadius: cornerRadius, rotationCount: rotationCount, opacity: opacity, degree: degree, isSelectable: isSelectable, placement: placement, heightConstant: heightConstant, spacingConstant: spacingConstant, middleConstant: middleConstant, topWidthConstant: topWidthConstant, topHeightConstant: topHeightConstant, yAxisConstant: yAxisConstant)
        
        return generation
    }

    public func createGenerationsWithMutation(lastGeneration: Generation) -> [Generation] {
        var newGenerations = [Generation]()
        
        for i in 0...3 {
            newGenerations.append(Generation(number: lastGeneration.number + 1, color: UIColor.addRandomColor(color: lastGeneration.color), cornerRadius: lastGeneration.cornerRadius + .random(in: -3...3), rotationCount: lastGeneration.rotationCount + .random(in: -5...5), opacity: lastGeneration.opacity + .random(in: -0.03...0.03), degree: lastGeneration.degree + .random(in: -12.0...12.0), isSelectable: true, placement: i + 1, heightConstant: lastGeneration.heightConstant + .random(in: -0.1...0.1), spacingConstant: lastGeneration.spacingConstant + .random(in: -0.01...0.01), middleConstant: lastGeneration.middleConstant + .random(in: -0.1...0.1), topWidthConstant: lastGeneration.topWidthConstant + .random(in: -0.02...0.02), topHeightConstant: lastGeneration.topHeightConstant + .random(in: -0.03...0.03), yAxisConstant: lastGeneration.yAxisConstant + .random(in: -0.1...0.1)))
        }
        
        return newGenerations
    }
}
