/*:
 
 # Assembling The Parts
 
 Right now, all of the digits are ready and we're good to go. But still, we have _one more thing_ to do.
 
 Guess what's that? We have to assemble all of the digits accordingly!
 
 Let's remember the order of sections:
 
 1. Start Guard
 2. Left Section
 3. Middle Guard
 4. Right Section
 5. End Guard
 
 Now, press a section from the top to select it.
 
 You can press the sections in the bottom to place the currently selected item there.
 
 You can press a selected section/filled section to unselect it/make it empty.
 
 After placing the sections, press "Check" to check your result. You can press "Reset" to make all sections empty again, if something goes wrong.
 
*/
//#-hidden-code
import SwiftUI
import PlaygroundSupport

let view = AssemblingView()
let page = UIHostingController(rootView: view)
page.preferredContentSize = CGSize(width: 800, height: 600)
PlaygroundPage.current.liveView = page
//#-end-hidden-code

