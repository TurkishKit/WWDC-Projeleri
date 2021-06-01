//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Instantiates a live view and passes it to the PlaygroundSupport framework.
//

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    
    // MARK: - Content View
    var body: some View {
        ZStack{
            
            // Background
            Color.black
            
            VStack(spacing: 20){
                
                Image(systemName: "bubble.left.and.bubble.right.fill")
                    .font(.system(size: 100, weight: .medium, design: .default))
                    .foregroundColor(Color.green)
                    .padding(.bottom, 20.0)
                
                
                // Text: subHeadline
                Text("This playground aims to teach what Ideational Apraxia disorder is. Run the code to get started.")
                    .font(.system(size: 25, weight: .medium, design: .default))
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 130.0)
            }
        }
    }
}

let view = ContentView()
let page = UIHostingController(rootView: view)
PlaygroundPage.current.liveView = page
