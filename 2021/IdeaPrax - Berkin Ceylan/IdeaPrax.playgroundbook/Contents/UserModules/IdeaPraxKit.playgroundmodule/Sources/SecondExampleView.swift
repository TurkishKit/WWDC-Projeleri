//
//  SecondExampleView.swift
//  UserModule
//
//  Created by Berkin Ceylan on 13.04.2021.
//

import SwiftUI
import PlaygroundSupport

// MARK: - Introduction View
public struct SecondExampleView: View {
    
    // MARK: - Properties
    var duration = 0.5
    
    @State var opacity1 = true
    @State var opacity2 = true
    @State var opacity3 = true
    @State var opacity4 = true
    @State var opacity5 = true
    @State var opacity6 = true
    @State var opacity7 = true
    @State var opacity8 = true
    
    @State private var showingSheet = false
    @State private var showingSheet2 = false
    
    // MARK: - Life Cycle
    public init() {}
    
    // MARK: - Content View
    public var body: some View {
        
        let box1 = SquareBoxView(number: 1, image: "1")
        let box2 = SquareBoxView(number: 2, image: "2")
        let box3 = SquareBoxView(number: 3, image: "3")
        let box4 = SquareBoxView(number: 4, image: "4")
        
        let box5 = SquareBoxView(number: 1, image: "3")
        let box6 = SquareBoxView(number: 2, image: "1")
        let box7 = SquareBoxView(number: 3, image: "2")
        let box8 = SquareBoxView(number: 4, image: "4")
        
        ZStack{
            
            // Background
            Color.black
            
            VStack(spacing: 100){
                
                if showingSheet {
                    VStack{
                        
                        // Text
                        Text("Regular")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding()
                        
                        // SquareBoxs
                        HStack{
                            box1.opacity(opacity1 ? 0 : 1)
                            box2.opacity(opacity2 ? 0 : 1)
                            box3.opacity(opacity3 ? 0 : 1)
                            box4.opacity(opacity4 ? 0 : 1)
                        }
                    }
                }
                
                if showingSheet2 {
                    VStack{
                        
                        // Text
                        Text("Ideational Apraxia")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding()
                        
                        // SquareBoxs
                        HStack{
                            box5.opacity(opacity5 ? 0 : 1)
                            box6.opacity(opacity6 ? 0 : 1)
                            box7.opacity(opacity7 ? 0 : 1)
                            box8.opacity(opacity8 ? 0 : 1)
                        }
                    }
                }
                
            }.onAppear{
                //
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation(.easeInOut(duration: duration)) {
                        
                        self.showingSheet.toggle()
                        
                    }
                }
                
                //
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation(.easeInOut(duration: duration)) {
                        
                        self.opacity1.toggle()
                        
                    }
                }
                
                //
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation(.easeInOut(duration: duration)) {
                        
                        self.opacity2.toggle()
                        
                    }
                }
                
                //
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    withAnimation(.easeInOut(duration: duration)) {
                        
                        self.opacity3.toggle()
                        
                    }
                }
                
                //
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    withAnimation(.easeInOut(duration: duration)) {
                        
                        self.opacity4.toggle()
                        
                    }
                }
                
                //
                DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                    withAnimation(.easeInOut(duration: duration)) {
                        
                        self.showingSheet2.toggle()
                        
                    }
                }
                
                //
                DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                    withAnimation(.easeInOut(duration: duration)) {
                        
                        self.opacity5.toggle()
                        
                    }
                }
                
                //
                DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
                    withAnimation(.easeInOut(duration: duration)) {
                        
                        self.opacity6.toggle()
                        
                    }
                }
                
                //
                DispatchQueue.main.asyncAfter(deadline: .now() + 9) {
                    withAnimation(.easeInOut(duration: duration)) {
                        
                        self.opacity7.toggle()
                        
                    }
                }
                
                //
                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                    withAnimation(.easeInOut(duration: duration)) {
                        
                        self.opacity8.toggle()
                        
                    }
                }
            }
        }
    }
}
