/*:
 
 # Congratulations! You did it! 🎉
 
 You've completed this playground succesfully. I hope that you've learned everything you need about barcodes.
 
 By the way, you can call yourself a *"Barcode Master"* from now on. 😁
 
*/
//#-hidden-code
import SwiftUI
import PlaygroundSupport

let view = CongratulationsView()
let page = UIHostingController(rootView: view)
page.preferredContentSize = CGSize(width: 800, height: 600)
PlaygroundPage.current.liveView = page
let success = NSLocalizedString("Great job! You've completed the playground", comment:"Great!")
PlaygroundPage.current.assessmentStatus = .pass(message: success)
//#-end-hidden-code

