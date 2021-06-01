/*:
 ![Playground Logo](RealLife.png)
 
 # Real Life Example
 
 As a test of this disorder, people are usually asked to walk from one point to different points or to take some objects in turn. Although these processes do not take too long, we can perform a faster test process with our computers and even iPads.💻
 
 Activities we do every day, such as brushing teeth, help us better understand this disorder.🩺 Before you start the quick test, click on the "Run My Code" button to see a real life example.🔨
 
 ### Regular Process for Brushing Teeth
 
 1. Take the toothpaste on your hand.
 2. Open the lid of the toothpaste.
 3. Take the toothbrush in your hand.
 4. Apply the paste to your outer brush.
 
 ### Ideational Apraxia Process for Brushing Teeth
 
 1. Take the toothbrush in your hand.
 2. Take the toothpaste on your hand.
 3. Open the lid of the toothpaste.
 4. Apply the paste to your outer brush.
 
  ---
*/
//#-hidden-code
import SwiftUI
import PlaygroundSupport

let view = SecondExampleView()
let page = UIHostingController(rootView: view)
PlaygroundPage.current.liveView = page

var success = NSLocalizedString("It's time to brush your teeth!🦷 Doctors say the procedures to be done to brush teeth for the detection of this disease. \n\n[Next page 􀆊](@next)", comment:"Success message")
PlaygroundPage.current.assessmentStatus = .pass(message: success)
//#-end-hidden-code
