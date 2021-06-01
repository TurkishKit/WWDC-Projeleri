/*:
 ![Playground Logo](ThatsIt.png)
 
 # That’s It!
 
 You've finished the playground! Hopefully, you learned a lots of things. If you are interest about evolution, you can make your own evolution models. Even if you know Swift programming language, you can create your own playgorund like that.
 
 I hope you are enjoy this playground. Take care of yourself. Bye bye! 👋
 
  ---
*/
//#-hidden-code
import SwiftUI
import PlaygroundSupport

let view = ThatsItView()
let page = UIHostingController(rootView: view)
page.preferredContentSize = CGSize(width: 800, height: 600)
PlaygroundPage.current.liveView = page

var success = NSLocalizedString("### Congratulations! \n\nYou have finished this playground.", comment:"Success message")
PlaygroundPage.current.assessmentStatus = .pass(message: success)
//#-end-hidden-code
