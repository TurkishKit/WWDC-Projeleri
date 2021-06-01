import SwiftUI

public struct DataTunnelImageView: View {
    
    // MARK: - Properties
    public let uiImage: UIImage
    
    // MARK: - Life Cycle
    public init(uiImage: UIImage) {
        self.uiImage = uiImage
    }
    
    // MARK: - View
    public var body: some View {
        Image(uiImage: uiImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 210, height: 210)
            .border(Color.white, width: 2)
    }
}
