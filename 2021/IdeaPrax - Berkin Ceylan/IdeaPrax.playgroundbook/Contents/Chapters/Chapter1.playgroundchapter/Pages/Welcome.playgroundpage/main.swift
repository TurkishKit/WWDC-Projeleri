/*:
 ![Playground Logo](Welcome.png)
 
 # Welcome!
 
 IdeaPrax is a playground that aims to make people of all understand what Ideational Apraxia disorder is and whether you have it. To do this, it tells the important points of Ideational Apraxia through simple and colorful cubes.🧑‍⚕️

 In this playground, we will learn a lot about Ideational Apraxia.🤓 Firstly let's learn exactly what Ideational Apraxia disorder is! To move to the [next page](@next), please click on the "Run My Code" button at the bottom right.

  ---
*/
//#-hidden-code
import SwiftUI
import PlaygroundSupport

let view = IntroductionView()
let page = UIHostingController(rootView: view)
PlaygroundPage.current.liveView = page

var success = NSLocalizedString("### Hey!🥳 \n\nI'm Berkin. I'm so happy to meet you and hope everything is okay. \n\n[Next page 􀆊](@next)", comment:"Success message")
PlaygroundPage.current.assessmentStatus = .pass(message: success)
//#-end-hidden-code
