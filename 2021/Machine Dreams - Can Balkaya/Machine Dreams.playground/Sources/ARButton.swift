import SwiftUI

public struct ARButton: View {
    
    // MARK: - Properties
    let action: () -> Void
    
    // MARK: - Life Cycle
    public init(action: @escaping () -> Void) {
        self.action = action
    }
    
    // MARK: - View
    public var body: some View {
        #if canImport(ARKit)
        Button(action: action) {
            HStack {
                Image(systemName: "arkit")
                    .imageScale(.large)
                Text("Experience in AR")
            }
            .font(.system(.headline))
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(Color.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        }
        #endif
    }
}
