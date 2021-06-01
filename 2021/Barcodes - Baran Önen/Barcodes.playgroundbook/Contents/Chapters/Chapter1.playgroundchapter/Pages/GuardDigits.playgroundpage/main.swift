/*:
 
 # Guard Digits
 
 There are also 3 digits that help us locate where the barcode ends, where it starts and where its middle point is.
 
 While the middle digit has 5 bars in it, the start and end digits have 3. Here are their patterns:
 
 - Start: 101
 - Middle: 01010
 - End: 101
 
 Now, run the code and see how these digits look.
*/
//#-hidden-code
import SwiftUI
import PlaygroundSupport

let view = GuardDigitsView()
let page = UIHostingController(rootView: view)
page.preferredContentSize = CGSize(width: 800, height: 600)
PlaygroundPage.current.liveView = page
let success = NSLocalizedString("Well done!💪 \n\n[**Next Page**](@next)", comment:"Let's Go!")
PlaygroundPage.current.assessmentStatus = .pass(message: success)
//#-end-hidden-code
