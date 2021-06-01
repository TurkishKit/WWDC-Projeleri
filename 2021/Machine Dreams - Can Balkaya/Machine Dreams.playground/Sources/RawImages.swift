import Foundation

public struct RawImages: Decodable {
    
    // MARK: - Properties
    let all: [RawImage]
    
    // MARK: - Life Cycle
    public init(all: [RawImage]) {
        self.all = all
    }
}
