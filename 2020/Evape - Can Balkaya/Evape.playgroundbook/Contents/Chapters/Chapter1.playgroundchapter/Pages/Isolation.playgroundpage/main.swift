/*:
 ![Playground Logo](Isolation.png)
 
 # Isolation
 
 Isolation is that groups of the same species cannot interact with each other for a long time due to geographical barriers. While living groups isolated from each other were first classified as the same species, they gradually differ from each other because they are exposed to different selection pressures. An example of this is living things isolated from their groups as a result of a _natural disaster_. 🏔
 
 Now we will look at this isolation process with the shapes. To do this, press the "Run My Code" button. When the program first runs, the two shapes will be exactly the same. Press the "Change" button to differentiate these two. So you put the left-hand shape on "A" place. If you want to send the shape to its old location, you should press the "Change" button again.
 
  ---
*/
//#-hidden-code
import SwiftUI
import PlaygroundSupport

let view = IsolationView()
let page = UIHostingController(rootView: view)
page.preferredContentSize = CGSize(width: 800, height: 600)

PlaygroundPage.current.liveView = page
//#-end-hidden-code
