import SwiftUI

public struct DataTunnelImageDetailView: View {
    
    // MARK: - Properties
    @Binding var rawImage: RawImage
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - View
    public var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    Text(rawImage.detail)
                        .font(.body)
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle(rawImage.name)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("Back") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}
