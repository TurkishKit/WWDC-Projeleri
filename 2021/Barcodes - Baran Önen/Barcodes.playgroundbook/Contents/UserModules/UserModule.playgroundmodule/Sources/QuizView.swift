//
//  QuizView.swift
//  PlaygroundBook
//
//  Created by Baran Önen on 14.04.2021.
//

import SwiftUI
import PlaygroundSupport

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
}

public struct QuizView: View {
    @State var firstCardOffset = CGSize.zero
    @State var currentX: CGFloat = 0.0
    @State var currentQuestion = 1
    @State var trueAnswers = 0
    @State var falseAnswers = 0
    
    public init() {}
    
    public var body: some View {
        VStack {
            HStack {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60, alignment: .center)
                    .foregroundColor(currentX < -150 ? Color(UIColor.systemRed) : Color.secondary.opacity(0.5))
                    .colorMultiply(currentX < -150 ? Color(UIColor.systemRed) : Color.secondary.opacity(0.5))
                    .animation(.easeInOut(duration: 0.2))
                    .hidden(currentQuestion == 6 ? true : false)
                Spacer()
                if currentQuestion < 6 {
                    VStack {
                        Text("Question \(currentQuestion)/5")
                            .font(.title)
                        HStack {
                            Text("If the statement is correct, swipe right")
                                .multilineTextAlignment(.center)
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color(UIColor.systemGreen))
                        }
                        HStack {
                            Text("If the statement is wrong, swipe left")
                                .multilineTextAlignment(.center)
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color(UIColor.systemRed))
                        }
                    }
                } else {
                    Text("Results")
                        .font(.title)
                }
                Spacer()
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60, alignment: .center)
                    .foregroundColor(currentX > 150 ? Color(UIColor.systemGreen) : Color.secondary.opacity(0.5))
                    .colorMultiply(currentX > 150 ? Color(UIColor.systemGreen) : Color.secondary.opacity(0.5))
                    .animation(.easeInOut)
                    .hidden(currentQuestion == 6 ? true : false)
            }
            .padding()
            Spacer()
            
            
            ZStack {
                VStack {
                    Spacer()
                    HStack {
                        Image(systemName: "checkmark")
                            .foregroundColor(Color(UIColor.systemGreen))
                        Text("\(trueAnswers) correct answer(s)")
                            .font(.title)
                    }
                    .padding(.bottom)
                    HStack {
                        Image(systemName: "xmark")
                            .foregroundColor(Color(UIColor.systemRed))
                        Text("\(falseAnswers) wrong answer(s)")
                            .font(.title)
                    }
                    Spacer()
                    Button("Take the quiz again") {
                        trueAnswers = 0
                        falseAnswers = 0
                        currentQuestion = 1
                    }
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(minWidth: 100, maxWidth: .infinity, alignment: .center)
                    .background(Color(UIColor.systemBlue))
                    .cornerRadius(12)
                    .contentShape(Rectangle())
                    .padding(.horizontal)
                }
                .hidden(currentQuestion == 6 ? false : true)
                .onChange(of: currentQuestion, perform: { _ in
                    if currentQuestion == 6 {
                        let success = NSLocalizedString("The quiz is completed! 🚀 \n\n[**Next Page**](@next)", comment:"Let's continue!")
                        PlaygroundPage.current.assessmentStatus = .pass(message: success)
                    }
                })
                
                HStack {
                    Text("The leftmost digit gives general information about the product")
                        .multilineTextAlignment(.center)
                        .font(.title)
                }
                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 300, maxHeight: 300, alignment: .center)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(14.0)
                .padding(.horizontal, 40.0)
                .offset(firstCardOffset)
                .gesture(DragGesture()
                            .onChanged { value in
                                self.firstCardOffset.width = value.translation.width * 1.4
                                currentX = value.translation.width * 1.4
                            }
                            .onEnded { value in
                                if self.firstCardOffset.width > 150 {
                                    self.firstCardOffset.width = 800
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        self.firstCardOffset = CGSize.zero
                                        currentX = 0
                                        trueAnswers += 1
                                        currentQuestion += 1
                                    }
                                } else if self.firstCardOffset.width < -150 {
                                    self.firstCardOffset.width = -800
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        self.firstCardOffset = CGSize.zero
                                        currentX = 0
                                        falseAnswers += 1
                                        currentQuestion += 1
                                    }
                                } else {
                                    self.firstCardOffset.width = 0
                                    currentX = 0
                                }
                            }
                )
                .hidden(currentQuestion == 5 ? false : true)
                .animation(Animation.interactiveSpring(response: 0.3))
                
                HStack {
                    Text("Start guard digit's pattern is 01010")
                        .multilineTextAlignment(.center)
                        .font(.title)
                }
                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 300, maxHeight: 300, alignment: .center)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(14.0)
                .padding(.horizontal, 40.0)
                .offset(firstCardOffset)
                .gesture(DragGesture()
                            .onChanged { value in
                                self.firstCardOffset.width = value.translation.width * 1.4
                                currentX = value.translation.width * 1.4
                            }
                            .onEnded { value in
                                if self.firstCardOffset.width > 150 {
                                    self.firstCardOffset.width = 800
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        self.firstCardOffset = CGSize.zero
                                        currentX = 0
                                        falseAnswers += 1
                                        currentQuestion += 1
                                    }
                                } else if self.firstCardOffset.width < -150 {
                                    self.firstCardOffset.width = -800
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        self.firstCardOffset = CGSize.zero
                                        currentX = 0
                                        trueAnswers += 1
                                        currentQuestion += 1
                                    }
                                } else {
                                    self.firstCardOffset.width = 0
                                    currentX = 0
                                }
                            }
                )
                .hidden(currentQuestion == 4 ? false : true)
                .animation(Animation.interactiveSpring(response: 0.3))
                
                HStack {
                    Text("There are two check digits")
                        .multilineTextAlignment(.center)
                        .font(.title)
                }
                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 300, maxHeight: 300, alignment: .center)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(14.0)
                .padding(.horizontal, 40.0)
                .offset(firstCardOffset)
                .gesture(DragGesture()
                            .onChanged { value in
                                self.firstCardOffset.width = value.translation.width * 1.4
                                currentX = value.translation.width * 1.4
                            }
                            .onEnded { value in
                                if self.firstCardOffset.width > 150 {
                                    self.firstCardOffset.width = 800
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        self.firstCardOffset = CGSize.zero
                                        currentX = 0
                                        falseAnswers += 1
                                        currentQuestion += 1
                                    }
                                } else if self.firstCardOffset.width < -150 {
                                    self.firstCardOffset.width = -800
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        self.firstCardOffset = CGSize.zero
                                        currentX = 0
                                        trueAnswers += 1
                                        currentQuestion += 1
                                    }
                                } else {
                                    self.firstCardOffset.width = 0
                                    currentX = 0
                                }
                            }
                )
                .hidden(currentQuestion == 3 ? false : true)
                .animation(Animation.interactiveSpring(response: 0.3))
                
                HStack {
                    Text("There are four guard digits")
                        .multilineTextAlignment(.center)
                        .font(.title)
                }
                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 300, maxHeight: 300, alignment: .center)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(14.0)
                .padding(.horizontal, 40.0)
                .offset(firstCardOffset)
                .gesture(DragGesture()
                            .onChanged { value in
                                self.firstCardOffset.width = value.translation.width * 1.4
                                currentX = value.translation.width * 1.4
                            }
                            .onEnded { value in
                                if self.firstCardOffset.width > 150 {
                                    self.firstCardOffset.width = 800
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        self.firstCardOffset = CGSize.zero
                                        currentX = 0
                                        falseAnswers += 1
                                        currentQuestion += 1
                                    }
                                } else if self.firstCardOffset.width < -150 {
                                    self.firstCardOffset.width = -800
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        self.firstCardOffset = CGSize.zero
                                        currentX = 0
                                        trueAnswers += 1
                                        currentQuestion += 1
                                    }
                                } else {
                                    self.firstCardOffset.width = 0
                                    currentX = 0
                                }
                            }
                )
                .hidden(currentQuestion == 2 ? false : true)
                .animation(Animation.interactiveSpring(response: 0.3))
                
                HStack {
                    Text("There are 95 small sectors and every 8 of them make a digit")
                        .multilineTextAlignment(.center)
                        .font(.title)
                }
                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 300, maxHeight: 300, alignment: .center)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(14.0)
                .padding(.horizontal, 40.0)
                .offset(firstCardOffset)
                .gesture(DragGesture()
                            .onChanged { value in
                                self.firstCardOffset.width = value.translation.width * 1.4
                                currentX = value.translation.width * 1.4
                            }
                            .onEnded { value in
                                if self.firstCardOffset.width > 150 {
                                    self.firstCardOffset.width = 800
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        self.firstCardOffset = CGSize.zero
                                        currentX = 0
                                        trueAnswers += 1
                                        currentQuestion += 1
                                    }
                                } else if self.firstCardOffset.width < -150 {
                                    self.firstCardOffset.width = -800
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        self.firstCardOffset = CGSize.zero
                                        currentX = 0
                                        falseAnswers += 1
                                        currentQuestion += 1
                                    }
                                } else {
                                    self.firstCardOffset.width = 0
                                    currentX = 0
                                }
                            }
                )
                .hidden(currentQuestion == 1 ? false : true)
                .animation(Animation.interactiveSpring(response: 0.3))
            }
            
            
            Spacer()
        }
        .background(Color(UIColor.systemBackground))
    }
}
