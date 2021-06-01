/*:
 ![Barcodes Logo](Welcome.png)
 
 # Hello there!
 
 Barcodes are being used everyday in places like supermarkets, grocery stores, depots, airports and even Apple Stores. However, most of the people have no idea about what's going on in the background and how this system runs extremely fast and reliable.
 In this playground, we're going to end this lack of information while also learning Swift.
 
 So, if you're ready, fasten your seat belts🦺, make sure your iPad is in the landscape mode and
 
 ### Press "Run My Code" ▶️ to send these parcels to the scanning place. They will be identified using their barcodes.
 
 _Barcodes that were used in the assets of this playground were created using [TEC-IT Barcode Generator](https://barcode.tec-it.com/en/)_
 
 _Some information that will be used in the next pages were taken from [Wikipedia](https://en.wikipedia.org/wiki/Universal_Product_Code)_
*/
//#-hidden-code
import SwiftUI
import PlaygroundSupport

let view = WelcomeView()
let page = UIHostingController(rootView: view)
page.preferredContentSize = CGSize(width: 800, height: 600)
PlaygroundPage.current.liveView = page
let success = NSLocalizedString("Click to start learning how barcodes work! \n\n[**Next Page**](@next)", comment:"Let's Go!")
PlaygroundPage.current.assessmentStatus = .pass(message: success)
//#-end-hidden-code
