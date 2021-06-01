/*:
 ![Playground Logo](Evolution.png)
 
 # Evolution
 
 "Evolution is change in the heritable characteristics of biological populations over successive generations. These characteristics are the expressions of **genes** that are passed on from parent to offspring during reproduction. Different characteristics tend to exist within any given population as a result of **mutation**, **genetic recombination** and other sources of **genetic variation**. Evolution occurs when evolutionary processes such as natural selection (including **sexual selection**) and **genetic drift** act on this variation, resulting in certain characteristics becoming more common or rare within a population."
 
 📖 Source: [Wikipedia](https://en.wikipedia.org/wiki/Evolution)
 
  ---
 
 As can be seen from the text, evolution is one of the things that make us who we are. After all, everything would be the same without diversity. 🙃
 
 Diversification in our nature is relatively slow for a human life. For example, with the chimpanzees, our closest cousins living now, our last common ancestor lived about 6 million years ago. So, The noticeable changes that you can understand occur, at least in general, very slowly for living things. 🙊
 
 The evolution of most living things in nature is relatively long. Of course, we can create faster evolutionary processes with our computers and even iPads. This Playground is also for that. Before you start creating new evolutionary process, click on the "Run My Code" button to see a sample evolutionary process. 💻
 
 You will see when you run the project, the shapes are descendants of the first shape. New generations get genes from previous generations, they are of course similar to them, but as you can see, the similarity decreases as the difference between generations increases. ⏰
 
 ---
*/
//#-hidden-code
import SwiftUI
import PlaygroundSupport

let view = EvolutionView()
let page = UIHostingController(rootView: view)
page.preferredContentSize = CGSize(width: 800, height: 600)

PlaygroundPage.current.liveView = page

var success = NSLocalizedString("Now that you have seen an exemplary evolutionary process, you are ready to learn what the gene. Get ready to create your own shapes! \n\n[**Next Page**](@next)", comment:"Success message")
PlaygroundPage.current.assessmentStatus = .pass(message: success)
//#-end-hidden-code
