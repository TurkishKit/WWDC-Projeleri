import SwiftUI

public struct DataTunnelView: View {
    
    // MARK: - Properties
    let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 4)
    @State var showingInfos = true
    @State var showingDetailScreen = false
    @State var rawImage = RawImage.example
    var rawImages: RawImages {
        readJSONFromFile(fileName: "images", type: RawImages.self)!
    }
    
    public init() {}
    
    // MARK: - View
    public var body: some View {
        VStack {
            VStack {
                TitleView(text: "Images from World and Mars")
                DescriptionView(text: "You can see other pictures by scrolling upwards, and by clicking on the pictures, you can learn detailed information about it.")
            }
            .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(rawImages.all.indices) { index in
                        DataTunnelImageView(uiImage: UIImage(named: "Real-Photos/\(rawImages.all[index].name)")!)
                            .onTapGesture {
                                self.rawImage = rawImages.all[index]
                                showingDetailScreen = true
                            }
                    }
                }
            }
        }
        .sheet(isPresented: $showingDetailScreen) {
            DataTunnelImageDetailView(rawImage: $rawImage)
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    // MARK: - Methods
    public func readJSONFromFile<T: Decodable>(fileName: String, type: T.Type) -> T? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                return jsonData
            } catch {
                fatalError("error:\(error.localizedDescription)")
            }
        }
        return nil
    }
}
