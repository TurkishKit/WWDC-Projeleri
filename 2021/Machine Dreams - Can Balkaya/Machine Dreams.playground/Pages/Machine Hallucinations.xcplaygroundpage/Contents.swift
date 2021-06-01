/*:
 ![Playground Logo](Machine-Hallucinations.png)
 
 # Machine Hallucinations
 I sometimes think about that a work of art can be in a constant state of change according to the person looking at it. That's why, I wanted to include this topic in this playground.
 
 In this page, the AI data sculpture changes according to the momentary mood of the person who looking at it and when you do not show your face, the AI data sculpture will be freezed. 🎨
 
 ---
 
 [Next Page:  Epilog](@next)
 
  ---
*/
//#-hidden-code
import SwiftUI
import PlaygroundSupport

PlaygroundPage.current.setLiveView(MachineHallucinationsView(scene: WaveScene(sceneCase: .machineHallucinations, centerDistance: 0.3, radius: 0.3)))
//#-end-hidden-code
