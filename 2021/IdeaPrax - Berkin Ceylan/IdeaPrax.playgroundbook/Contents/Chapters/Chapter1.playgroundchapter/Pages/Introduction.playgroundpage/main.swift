/*:
 ![Playground Logo](Introduction.png)
 
 # Introduction to Ideational Apraxia
 
 "Ideational apraxia (IA) is a neurological disorder which explains the loss of ability to conceptualize, plan, and execute the complex sequences of motor actions involved in the use of tools or otherwise interacting with objects in everyday life.🧠 Ideational apraxia is a condition in which an individual is unable to plan movements related to interaction with objects, because they have lost the perception of the object's purpose. Characteristics of this disorder include a disturbance in the concept of the sequential organization of voluntary actions.🤕 The patient appears to have lost the knowledge or thought of what an object represents."
 
 💫 Source: [Wikipedia](https://en.wikipedia.org/wiki/Ideational_apraxia)

 The example on the right shows a regular order and how people with the Ideational Apraxia disorder make this order. Please click on the "Run My Code" button to see a sample Ideational apraxia process. 🦾
 
  ---
*/
//#-hidden-code
import SwiftUI
import PlaygroundSupport

let view = FirstExampleView()
let page = UIHostingController(rootView: view)
PlaygroundPage.current.liveView = page

var success = NSLocalizedString("### Hello again!👋 \n\nHere you can see the procedures given in a particular order and how people with regular and Ideational Apraxia disorder behave. \n\n[Next page 􀆊](@next)", comment:"Success message")
PlaygroundPage.current.assessmentStatus = .pass(message: success)
//#-end-hidden-code
