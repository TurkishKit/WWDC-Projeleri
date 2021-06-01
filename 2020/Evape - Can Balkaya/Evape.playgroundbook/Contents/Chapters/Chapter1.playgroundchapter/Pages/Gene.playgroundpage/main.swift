/*:
 ![Playground Logo](Gene.png)
 
 # Gene
 
 "Genes can acquire mutations in their sequence, leading to different variants, known as alleles, in the population. These alleles encode slightly different versions of a protein, which cause different phenotypical traits. Usage of the term "having a gene" (e.g., "good genes," "hair colour gene") typically refers to containing a different allele of the same, shared gene. Genes evolve due to natural selection / survival of the fittest and genetic drift of the alleles."
 
 📖 Source: [Wikipedia](https://en.wikipedia.org/wiki/Gene)
 
 ---
 
 All the features of living things are determined by their genes. Likewise, all the features of the shapes here are determined by their genes.
 
 Below are 4 genes of our shape. The shape will also change if you change the genes. This way you can get the shape you want! 🎩
 
  ---
*/
//#-hidden-code
import SwiftUI
import PlaygroundSupport

var color: UIColor
var rotationCount: Int
var opacity: Double
var degree: Double

func createGeneration(color: UIColor, rotationCount: Int, opacity: Double, degree: Double) {
    let view = GeneView(color: color, rotationCount: rotationCount, opacity: opacity, degree: degree)
    let page = UIHostingController(rootView: view)
    page.preferredContentSize = CGSize(width: 800, height: 600)
    
    PlaygroundPage.current.liveView = page
    
    var success = NSLocalizedString("### Amazing! \nYou created your own shape! Now it's time for natural selection.\n\n[**Next Page**](@next)", comment:"Success message")
    PlaygroundPage.current.assessmentStatus = .pass(message: success)
}
//#-end-hidden-code
color = /*#-editable-code*/#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)/*#-end-editable-code*/
rotationCount = /*#-editable-code*/10/*#-end-editable-code*/
opacity = /*#-editable-code*/0.4/*#-end-editable-code*/
degree = /*#-editable-code*/50/*#-end-editable-code*/
//#-hidden-code
createGeneration(color: color, rotationCount: rotationCount, opacity: opacity, degree: degree)
//#-end-hidden-code
