//
//  QuickTestView.swift
//  UserModule
//
//  Created by Berkin Ceylan on 13.04.2021.
//

import SwiftUI
import PlaygroundSupport

// MARK: - Quick Test View
public struct QuickTestView: View {
    
    // MARK: - Properties
    let getRandom = randomNumberGenerator(min: 1, max: 5)
    
    // MARK: - Life Cycle
    public init() {}
    
    // MARK: - Content View
    public var body: some View {
        
        ZStack{
            
            // Background
            Color.black
            
            VStack{
                
                // Text
                Text("Quick Test")
                    .foregroundColor(Color.white)
                    .font(.system(size: 50, weight: .semibold, design: .default))
                    .padding(.bottom, 20)
                
                // Text
                Text("Click on the colors below in the correct order within 7 seconds.")
                    .font(.system(size: 20, weight: .medium, design: .default))
                    .foregroundColor(Color.gray)
                
                HStack(spacing:10){
                    
                    // Box
                    Box(number: getRandom(), color: .red)
                    Box(number: getRandom(), color: .yellow)
                    Box(number: getRandom(), color: .green)
                    Box(number: getRandom(), color: .purple)
                    Box(number: getRandom(), color: .blue)
                }
                .padding(.top, 80.0)
                
                // Button
                Button(action: {
                        let view = TestView()
                        let page = UIHostingController(rootView: view)
                        PlaygroundPage.current.liveView = page
                }) {
                    
                    // Text: Button
                    Text("Let's Start 􀆊")
                        .font(.system(size: 20, weight: .medium, design: .default))
                        .padding([.top,.bottom],10)
                        .padding([.leading,.horizontal],20)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.top, 140.0)
                
            }
        }
    }
}
