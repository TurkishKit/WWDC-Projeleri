/*:
 
 # Quiz
 
 It's time to see how well you learned about barcodes. Now, look at the questions and their answers for the last time.
 
 When you're ready, click "Run My Code" to start taking the quiz.
 
 ---
 
 Q: There are 95 small sectors and every 8 of them make a digit
 
 A: True
 
 ---
 
 Q: There are four guard digits
 
 A: False, there are 3
 
 ---
 
 Q: There are two check digits
 
 A: False, there is just one
 
 ---
 
 Q: Start guard digit's pattern is 01010
 
 A: False, its pattern is 101
 
 ---
 
 Q: The leftmost digit gives general information about the product
 
 A: True
 
*/
//#-hidden-code
import SwiftUI
import PlaygroundSupport

let view = QuizView()
let page = UIHostingController(rootView: view)
page.preferredContentSize = CGSize(width: 800, height: 600)
PlaygroundPage.current.liveView = page
//#-end-hidden-code

