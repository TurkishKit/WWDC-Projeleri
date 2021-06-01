import SwiftUI

public struct ButtonsStyle: ButtonStyle {
    
    // MARK: - Life Cycle
    public init() {}
    
    // MARK: - Functions
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(ButtonBackground(isHighlighted: configuration.isPressed, shape: RoundedRectangle(cornerRadius: 10)))
            .animation(.linear)
    }
}
