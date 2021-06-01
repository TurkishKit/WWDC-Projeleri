/*:
 ![Playground Logo](Data-Tunnel.png)
 
 # Data Tunnel

 On this page, I would like to show you the photos that are the main assets I use to create the AI data sculptures, which are the main elements of the playground exhibition. (You will see them next page.)
 
 You can see the photos and learn its details by clicking on the photos. 📷
 
 ---
 
 ## Development Process of This Exhibition
 Before start to the exhibition, I would like to explain briefly how I created this exhibition.
 
 ![Playground Logo](Process.png)
 
 At first it all starts with the photos of Mars and the World taken by Nasa and Roscosmos. The photos are actually the most important things for the color matching of the artificial intelligence data sculptures.
 
 I chose all the photos myself. Nearly 200 images are used to train artificial intelligence models.
 
 I trained an AI model to determine by which mood or moment these photos would be appeared or removed. I used Google's artificial intelligence software called Tensorflow for this task entirely.
 
 After creating my first Tensorflow model, I combined these photos with each other and created new photos. I've done this work with both Tensorflow and CreateML.
 
 I used Apple's SceneKit and ARKit frameworks to turn these images into 3D objects. Besides, I also made the movement of these 3D objects using a framework called Accelerate.
 
 Artificial intelligence data sculptures basically act by oscillating. That way, they can look like a single-piece organism.
 
 ---
 
 [Next Page:  AI Data Sculpture](@next)
 
  ---
*/
//#-hidden-code
import SwiftUI
import PlaygroundSupport

PlaygroundPage.current.setLiveView(DataTunnelView())
//#-end-hidden-code
