//
//  TestView.swift
//  UserModule
//
//  Created by Berkin Ceylan on 13.04.2021.
//

import SwiftUI

// MARK: - Test View
public struct TestView: View {
    
    // MARK: - Properties
    let time = 7
    let getRandom = randomNumberGenerator(min: 1, max: 5)
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var testMode = false
    @State var stopTest = false
    @State var showResult = false
    @State var showSheetView = false
    
    @State var level: Int = 1
    @State var timeRemaining = 7
    
    @State var number1: Int = 2
    @State var number2: Int = 1
    @State var number3: Int = 5
    @State var number4: Int = 3
    @State var number5: Int = 4
    
    // MARK: - Game Properties
    @State var score: Int = 0
    @State var boxTextCounter: Int = 0
    
    @State var realNumber1 = 0
    @State var realNumber2 = 0
    @State var realNumber3 = 0
    @State var realNumber4 = 0
    @State var realNumber5 = 0
    
    @State var isPressed1 = true
    @State var isPressed2 = true
    @State var isPressed3 = true
    @State var isPressed4 = true
    @State var isPressed5 = true
    
    @State var boxNumber1: Int = 0
    @State var boxNumber2: Int = 0
    @State var boxNumber3: Int = 0
    @State var boxNumber4: Int = 0
    @State var boxNumber5: Int = 0
    
    // MARK: - Functions
    func takeRealNumbers(){
        realNumber1 = number1
        realNumber2 = number2
        realNumber3 = number3
        realNumber4 = number4
        realNumber5 = number5
    }
    
    func takeScore(){
        if realNumber1 == boxNumber1{
            score = score + 4
        }
        if realNumber2 == boxNumber2{
            score = score + 4
        }
        if realNumber3 == boxNumber3{
            score = score + 4
        }
        if realNumber4 == boxNumber4{
            score = score + 4
        }
        if realNumber5 == boxNumber5{
            score = score + 4
        }
    }
    
    func gameRestart(){
        
        boxNumber1 = 0
        boxNumber2 = 0
        boxNumber3 = 0
        boxNumber4 = 0
        boxNumber5 = 0
        
        isPressed1 = true
        isPressed2 = true
        isPressed3 = true
        isPressed4 = true
        isPressed5 = true
        
        boxTextCounter = 0
    }
    
    func levelUp(){
        if level < 5 {
            level = level + 1
        }
    }
    
    func getNewNumbers(){
        number1 = getRandom()
        number2 = getRandom()
        number3 = getRandom()
        number4 = getRandom()
        number5 = getRandom()
    }
    
    func nextLevel(){
        self.gameRestart()
        self.levelUp()
        self.testMode.toggle()
        self.getNewNumbers()
        timeRemaining = time
    }
    
    func nextTest(){
        self.testMode.toggle()
        self.getNewNumbers()
        timeRemaining = time
    }
    
    // MARK: - Life Cycle
    public init() { }
    
    // MARK: - Content View
    public var body: some View {
        
        ZStack{
            
            // Background
            Color.black
            
            VStack{
                
                Text("Remaining Time: \(timeRemaining)")
                    .foregroundColor(Color.orange)
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                    .padding(.bottom, 15.0)
                    .onReceive(timer) { _ in
                        if timeRemaining > 0 {
                            timeRemaining -= 1
                            
                        } else if timeRemaining == 0 {
                            if !stopTest {
                                if testMode {
                                    self.takeScore()
                                    self.nextLevel()
                                    
                                } else {
                                    if level == 5 {
                                        stopTest = true
                                        showResult = true
                                    }
                                    self.takeRealNumbers()
                                    self.nextTest()
                                }
                                
                            } else {
                                if showResult {
                                    self.showSheetView.toggle()
                                    showResult = false
                                }
                            }
                        }
                    }
                
                if testMode {
                    
                    // Text
                    Text("Level \(level).")
                        .foregroundColor(Color.white)
                        .font(.system(size: 50, weight: .semibold, design: .default))
                        .padding(.bottom, 20)
                    
                    // Text
                    Text("Click on the colors below in the correct order within \(timeRemaining) seconds.")
                        .font(.system(size: 25, weight: .medium, design: .default))
                        .foregroundColor(Color.gray)
                    
                } else {
                    
                    // Text
                    Text("Get ready for Level \(level).")
                        .foregroundColor(Color.white)
                        .font(.system(size: 50, weight: .semibold, design: .default))
                        .padding(.bottom, 20)
                    
                    // Text
                    Text("Memorize the places and sequences of the numbers below.")
                        .font(.system(size: 25, weight: .medium, design: .default))
                        .foregroundColor(Color.gray)
                }
                
                if testMode {
                    HStack(spacing:10){
                        
                        // Button1
                        Button(action: {
                            if isPressed1 {
                                boxTextCounter = boxTextCounter + 1
                                boxNumber1 = boxTextCounter
                                self.isPressed1.toggle()
                            } else {
                                boxNumber1 = 0
                                boxTextCounter-=1
                                self.isPressed1.toggle()
                            }
                        }) {
                            Box(number: boxNumber1, color: .red)
                        }
                        
                        // Button2
                        Button(action: {
                            if isPressed2 {
                                boxTextCounter = boxTextCounter + 1
                                boxNumber2 = boxTextCounter
                                self.isPressed2.toggle()
                            } else {
                                boxNumber2 = 0
                                boxTextCounter-=1
                                self.isPressed2.toggle()
                            }
                        }) {
                            Box(number: boxNumber2, color: .yellow)
                        }
                        
                        // Button3
                        Button(action: {
                            if isPressed3 {
                                boxTextCounter = boxTextCounter + 1
                                boxNumber3 = boxTextCounter
                                self.isPressed3.toggle()
                            } else {
                                boxNumber3 = 0
                                boxTextCounter-=1
                                self.isPressed3.toggle()
                            }
                        }) {
                            Box(number: boxNumber3, color: .green)
                        }
                        
                        // Button4
                        Button(action: {
                            if isPressed4 {
                                boxTextCounter = boxTextCounter + 1
                                boxNumber4 = boxTextCounter
                                self.isPressed4.toggle()
                            } else {
                                boxNumber4 = 0
                                boxTextCounter-=1
                                self.isPressed4.toggle()
                            }
                        }) {
                            Box(number: boxNumber4, color: .purple)
                        }
                        
                        // Button5
                        Button(action: {
                            if isPressed5 {
                                boxTextCounter = boxTextCounter + 1
                                boxNumber5 = boxTextCounter
                                self.isPressed5.toggle()
                            } else {
                                boxNumber5 = 0
                                boxTextCounter-=1
                                self.isPressed5.toggle()
                            }
                        }) {
                            Box(number: boxNumber5, color: .blue)
                        }
                        
                    }
                    .padding(.top, 80.0)
                    .padding(.bottom, 180.0)
                    
                } else {
                    HStack(spacing:10){
                        
                        // Boxs
                        Box(number: number1, color: .red)
                        Box(number: number2, color: .yellow)
                        Box(number: number3, color: .green)
                        Box(number: number4, color: .purple)
                        Box(number: number5, color: .blue)
                    }
                    .padding(.top, 80.0)
                    .padding(.bottom, 180.0)
                    
                }
                
            }
        }.sheet(isPresented: $showSheetView) {
            ModalView(percent: score)
        }
    }
}
