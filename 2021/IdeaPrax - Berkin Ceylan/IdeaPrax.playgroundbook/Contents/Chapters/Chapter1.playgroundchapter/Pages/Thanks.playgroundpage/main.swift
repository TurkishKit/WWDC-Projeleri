/*:
 ![Playground Logo](Thanks.png)
 
 # Thank you!
 
 You've finished the playground! Hopefully, you learned a lots of things about Ideational Apraxia.
 
 I hope you are enjoy this playground. Take care of yourself. Bye! 👋
 
  ---
*/
//#-hidden-code
import SwiftUI
import PlaygroundSupport

let view = FinalView()
let page = UIHostingController(rootView: view)
PlaygroundPage.current.liveView = page

var success = NSLocalizedString("### Congratulations!🥳 \n\nYou have finished this playground.", comment:"Success message")
PlaygroundPage.current.assessmentStatus = .pass(message: success)
//#-end-hidden-code

