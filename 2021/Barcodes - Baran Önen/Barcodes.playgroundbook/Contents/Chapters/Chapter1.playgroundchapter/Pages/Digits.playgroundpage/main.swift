/*:
 
 # Digits
 
 A barcode has 15 digits. 5 of these digits have special meanings. The leftmost digit gives information about the product's category. There are also 3 more digits that are used to determine where the barcode starts, ends and where its center is located at. These 3 digits/sections are called "Guards"
 
 ![A barcode seperated into 15 sections](BarcodeDigitsScheme.png)

 
 The most right one is used for checking if the barcode was read correctly. We'll come back to this section later, since this is really important.
 
 So now, change the value variable to see which numbers mean which combinations.
 
 You can also see the digit on the left and right side of the barcode.
*/
//#-hidden-code
import SwiftUI
import PlaygroundSupport

//#-end-hidden-code
let value = /*#-editable-code*/1/*#-end-editable-code*/
//#-hidden-code

let view = DigitsView(value: value)
let page = UIHostingController(rootView: view)
page.preferredContentSize = CGSize(width: 800, height: 600)
PlaygroundPage.current.liveView = page
//#-end-hidden-code
