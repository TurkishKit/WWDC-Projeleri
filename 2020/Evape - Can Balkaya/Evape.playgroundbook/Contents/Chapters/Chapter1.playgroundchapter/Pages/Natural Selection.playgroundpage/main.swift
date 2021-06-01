/*:
 ![Playground Logo](NaturalSelection.png)
 
 # Natural Selection
 
 "Natural selection is the differential survival and reproduction of individuals due to differences in phenotype. It is a key mechanism of evolution, the change in the heritable traits characteristic of a population over generations."
 
 📖 Source: [Wikipedia](https://en.wikipedia.org/wiki/Natural_selection)
 
 ---
 
 As you will notice, natural selection processes the genes of organisms that are more suitable for environmental compatibility than others, by transferring them to new generations.
 
 Let's give an example with the shapes on this playground for that. For example, since the red and thin shapes are less noticeable, the probability of hunting is lower than the others. Let there be one shape type living in the environment. Those of these shapes are slightly larger than desired and a little bit closer to orange. 🟠
 
 As you can see when you run the page, our shape type will evolve towards the desired shape. Because the ones that are closer to the red and thinner shape group will be hunted less by hunters, they will be able to transfer their genes more to future generations.
 
  ---
*/
//#-hidden-code
import SwiftUI
import PlaygroundSupport

let view = NaturalSelectionView(targetGeneration: Storage().createGeneration(color: UIColor(red: 200/255, green: 30/255, blue: 30/255, alpha: 1), rotationCount: 50, opacity: 0.3, degree: 50))
let page = UIHostingController(rootView: view)
page.preferredContentSize = CGSize(width: 800, height: 600)

PlaygroundPage.current.liveView = page
//#-end-hidden-code
