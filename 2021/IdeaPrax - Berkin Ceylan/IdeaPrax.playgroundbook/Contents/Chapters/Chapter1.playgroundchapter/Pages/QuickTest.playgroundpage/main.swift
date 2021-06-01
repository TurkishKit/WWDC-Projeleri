/*:
 ![Playground Logo](QuickTest.png)
 
 # Quick Test
 
 Yes! Now a fun test awaits you. There are 5 levels in this test. You will have 7 seconds for each level and before each level you will be shown some numbers in some colored boxes.🌈 All you have to do is to touch these boxes in the correct order within 7 seconds.
 
 As a result, you will find a percentage. If you score above 7️⃣0️⃣ percent, this is a good sign. However, if you score below 4️⃣0️⃣ percent, it is recommended that you see a doctor.
 
 Enjoy!
 
 ---
 */
//#-hidden-code
import SwiftUI
import AVFoundation
import PlaygroundSupport

let view = QuickTestView()
let page = UIHostingController(rootView: view)
PlaygroundPage.current.liveView = page

var audioPlayer: AVAudioPlayer!

func playSounds(_ soundFileName : String) {
    guard let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: nil) else {
        fatalError("Unable to find \(soundFileName) in bundle")
    }
    
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
    } catch {
        print(error.localizedDescription)
    }
    audioPlayer.play()
}

playSounds("music.mp3")


var success = NSLocalizedString("### Test time!🚀 \n\nThis test, consisting of 5 levels, reveals the possibility of being Ideational Apraxia. What you have to do is very simple. Sequentially pressing the given numbers within 7 seconds.✨\n\nWhen finished the test, you can click here to switch to the other page.👉🏻 [Next page 􀆊](@next)", comment:"Success message")
PlaygroundPage.current.assessmentStatus = .pass(message: success)
//#-end-hidden-code
