import SwiftUI

struct ResultView: View {
    
    // MARK: - Properties
    let generations: [Generation]
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var seconds = 0
    @State var index = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let sizeConstant: CGFloat = 250
    let storage = Storage()
    
    // MARK: - UI Elements
    var body: some View {
        ZStack {
            Color.mainBackground
            
            ZStack {
                ForEach(generations.reversed(), id: \.self) { generation in
                    self.storage.createElement(generation: generation)
                        .opacity(self.index == generation.number - 1 ? 1 : 0)
                }
                .padding(.trailing, -10)
                .animation(.linear)
            }
            .frame(height: self.sizeConstant)
            .padding(.bottom, -10)
            .onReceive(timer) { time in
                if self.seconds == self.generations.count {
                    self.index = 0
                    self.seconds = 0
                    
                    self.timer.upstream.connect().cancel()
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    self.index += 1
                }

                self.seconds += 1
            }
        }
    }
}
