import SwiftUI

public struct ButtonView: View {
    
    // MARK: - Properties
    var text: String
    
    // MARK: - Life Cycle
    init(text: String){
        self.text = text
    }
    
    // MARK: - Content View
    public var body: some View {
        HStack {
            
            Text("\(text)")
                .textStyle(size: 20, color: .black, weight: .semibold)
            
            Image(systemName: "chevron.right.circle.fill")
                .foregroundColor(.black)
        }.padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
        .background(Color.white).cornerRadius(10.0)
    }
}
