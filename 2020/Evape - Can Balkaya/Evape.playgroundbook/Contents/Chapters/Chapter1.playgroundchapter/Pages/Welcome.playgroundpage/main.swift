/*:
 ![Playground Logo](Welcome.png)
 
 # Welcome!
 
 Evape is a playground that aims to make people of all ages understand what evolution is and how evolution works. To do this, it tells the important points of evolution through simple shape models. In this way, it can show an evolutionary process that can be equal to millions of years in nature. Of course, it does that in just a few seconds, not millions of years! That is amazing, right? 🤟

 In this playground, we will learn a lot about evolution. Firstly let's learn exactly what evolution is! To move to the [next page](@next), please click on the "Run My Code" button at the bottom right.
 
 Enjoy!
 
  ---
*/
//#-hidden-code
import SwiftUI
import PlaygroundSupport

let view = WelcomeView()
let page = UIHostingController(rootView: view)
page.preferredContentSize = CGSize(width: 800, height: 600)
PlaygroundPage.current.liveView = page

var success = NSLocalizedString("Click to learn what evolution is! \n\n[**Next Page**](@next)", comment:"Let's Learn!")
PlaygroundPage.current.assessmentStatus = .pass(message: success)
//#-end-hidden-code
