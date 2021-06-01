/*:
 
 # Check Digit
 
 As I said in the last page, there is a special digit that helps us check if all of the digits have been read correctly. This digit is located in the rightmost section of the barcode and it's called "Check Digit".
 
 This digit cannot have any data about the product. It only holds the result of a mathematical operation. This calculation is made using the digits in the barcode. Now, let's see the maths behind it.
 
 - Find the sum of the digits in the odd-numbered positions.
 - Multiply the result by 3.
 - Find the sum of the digits in the even-numbered positions and add it to the result.
 - Find the remainder of the result when divided to 10. In other words, find the result modulo 10.
 - If the result is 0, the check digit should be 0 as well. If it's not, the check digit should be (10 - result)
 
 The barcodeContent variable which is declared under this text has the value of the barcode without the check digit. Change the content to see the check digit to change as well.
 
*/
//#-hidden-code
import SwiftUI
import PlaygroundSupport

//#-end-hidden-code
let barcodeContent = /*#-editable-code*/"05100001251"/*#-end-editable-code*/
//#-hidden-code

let view = CheckDigitView(barcodeContent: barcodeContent)
let page = UIHostingController(rootView: view)
page.preferredContentSize = CGSize(width: 800, height: 600)
PlaygroundPage.current.liveView = page
//#-end-hidden-code
