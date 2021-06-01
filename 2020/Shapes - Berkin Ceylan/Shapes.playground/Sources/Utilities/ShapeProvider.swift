import SwiftUI
import PlaygroundSupport

fileprivate class ShapeProvider {
    
    // MARK: - Properties
    private let fileName = "shapeData"
    static let shared = ShapeProvider()
    
    // MARK: - Life Cycle
    init() { }
    
    // MARK: Functions
    func loadShapes() -> [ShapeData] {
        
        if let data = getData(for: fileName) {
            if let shapes = jsonDictionary(from: data) {
                do {
                    let data = try JSONSerialization.data(withJSONObject: shapes, options: .fragmentsAllowed)
                    let items = try JSONDecoder().decode([ShapeData].self, from: data)
                    
                    return items
                } catch {
                    print(error.localizedDescription)
                    return []
                }
            }
        }
        return []
    }
    
    private func getData(for resource: String) -> Data? {
        guard let url = Bundle.main.url(forResource: resource, withExtension: "json") else {
            fatalError("Couldn't load URL from provided string.")
        }
        
        do {
            return try Data(contentsOf: url)
        } catch {
            print("Couldn't load data from URL:\n\(error)")
            return nil
        }
    }
    
    private func jsonDictionary(from data: Data) -> [Any]? {
        do {
            let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            return (dictionary as? [Any])
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

// Shape data to be used in this app.
public let shapeData = ShapeProvider.shared.loadShapes()
