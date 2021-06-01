//
//  FirstExampleView.swift
//  UserModule
//
//  Created by Berkin Ceylan on 13.04.2021.
//

import SwiftUI
import PlaygroundSupport

// MARK: - First Example View
public struct FirstExampleView: View {
    
    // MARK: - Properties
    var textSize: CGFloat = 70
    var opacity = 0.1
    
    @State var opacity1 = true
    @State var opacity2 = true
    @State var opacity3 = true
    @State var opacity4 = true
    @State var opacity5 = true
    
    @State var opacity6 = true
    @State var opacity7 = true
    @State var opacity8 = true
    @State var opacity9 = true
    @State var opacity10 = true
    
    // MARK: - Life Cycle
    public init() {}
    
    // MARK: - Content View
    public var body: some View {
        
        let box1 = RectangleBoxView(number: "", color: .red)
        let box2 = RectangleBoxView(number:  "3", color: .yellow)
        let box3 = RectangleBoxView(number:  "1", color: .green)
        let box4 = RectangleBoxView(number:  "0", color: .blue)
        let box5 = RectangleBoxView(number:  "2", color: .purple)
        
        let box6 = RectangleBoxView(number:  "", color: .red)
        let box7 = RectangleBoxView(number:  "2", color: .yellow)
        let box8 = RectangleBoxView(number:  "3", color: .green)
        let box9 = RectangleBoxView(number:  "", color: .blue)
        let box10 = RectangleBoxView(number:  "1", color: .purple)
        
        ZStack{
            
            // Background
            Color.black
            
            // HStack
            HStack(spacing: 20){
                
                // VStack
                VStack(spacing: 20){
                    
                    // Text: Subtitle
                    Text("Regular")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    // Boxs
                    box1.opacity(opacity)
                    box2.opacity(opacity2 ? opacity : 1)
                    box3.opacity(opacity3 ? opacity : 1)
                    box4.opacity(opacity)
                    box5.opacity(opacity5 ? opacity : 1)
                    
                }
                
                // VStack
                VStack(spacing: 20){
                    
                    // Text: Subtitle
                    Text("Ideational Apraxia")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    // Boxs
                    box6.opacity(opacity)
                    box7.opacity(opacity7 ? opacity : 1)
                    box8.opacity(opacity8 ? opacity : 1)
                    box9.opacity(opacity)
                    box10.opacity(opacity10 ? opacity : 1)
                }
            }
            .padding(.horizontal, 80.0)
            .padding(.vertical, 150.0)
            
        }.onAppear{
            
            //
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    
                    self.opacity3.toggle()
                    
                }
            }
            
            //
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.opacity5.toggle()
                }
            }
            
            //
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    
                    self.opacity2.toggle()
                    
                }
            }
            
            //
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    
                    self.opacity10.toggle()
                    
                }
            }
            
            //
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.5) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    
                    self.opacity7.toggle()
                    
                }
            }
            
            //
            DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    
                    self.opacity8.toggle()
                    
                }
            }
        }
    }
}
