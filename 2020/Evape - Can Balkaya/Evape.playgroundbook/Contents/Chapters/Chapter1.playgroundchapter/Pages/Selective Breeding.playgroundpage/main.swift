/*:
 ![Playground Logo](SelectiveBreeding.png)
 
 # Selective Breeding
 
 "Selective breeding (also called artificial selection) is the process by which humans use animal breeding and plant breeding to selectively develop particular phenotypic traits (characteristics) by choosing which typically animal or plant males and females will sexually reproduce and have offspring together.
 
 📖 Source: [Wikipedia](https://en.wikipedia.org/wiki/Selective_breeding)
 
 ---
 
 Selective breeding is not only important for obtaining more yields from plants or animals, but also extremely important for the evolution of living things. For example, a female peacock chooses the male to mate with according to how fancy the male is. This creates a selection pressure because less fancy men have less chance of mating than more fancy ones.
 
 In this page, we will develop a shape type with artificial selection method. Just as the female peacock chooses the male, we will choose the shapes.
 
 To do this, first run the playground page. Then click the "+" button to create a new generation. When you click on one of the generations that appear at the top, that shape will now symbolize the second generation of your shape species. In this way, you can produce shape as many as you want. Also, you would like to see all the generations you have created in order as a slide, you can click the "Preview" button. 📹
 
 ---
*/
//#-hidden-code
import SwiftUI
import PlaygroundSupport

var color: UIColor
var rotationCount: Int
var opacity: Double
var degree: Double

let view = SelectiveBreedingView()
let page = UIHostingController(rootView: view)
page.preferredContentSize = CGSize(width: 800, height: 600)

PlaygroundPage.current.liveView = page
//#-end-hidden-code
