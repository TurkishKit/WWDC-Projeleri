import Foundation

public struct RawImage: Decodable {
    
    // MARK: - Properties
    let name: String
    let detail: String
    
    static let example = RawImage(name: "The Sahara Desert in central Libya", detail: "The International Space Station was flying 261 miles above the Sahara Desert when this photograph was taken of the Murzuq District in central Libya.")
    
    // MARK: - Life Cycle
    public init(name: String, detail: String) {
        self.name = name
        self.detail = detail
    }
}
