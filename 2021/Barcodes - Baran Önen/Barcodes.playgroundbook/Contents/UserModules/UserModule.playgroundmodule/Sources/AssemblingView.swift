//
//  AssemblingView.swift
//  PlaygroundBook
//
//  Created by Baran Önen on 30.03.2021.
//

import SwiftUI
import PlaygroundSupport

public struct LeftSection: View {
    public var body: some View {
        HStack(spacing: 0) {
            BarcodeDigit(value: "1")
            BarcodeDigit(value: "2")
            BarcodeDigit(value: "3")
            BarcodeDigit(value: "4")
            BarcodeDigit(value: "5")
            BarcodeDigit(value: "6")
        }
    }
}

public struct RightSection: View {
    public var body: some View {
        HStack(spacing: 0) {
            BarcodeDigit(value: "1")
            BarcodeDigit(value: "2")
            BarcodeDigit(value: "3")
            BarcodeDigit(value: "4")
            BarcodeDigit(value: "5")
            BarcodeDigit(value: "6")
        }
        .colorInvert()
    }
}

public struct AssemblingView: View {
    public init() {}
    
    @State var currentlySelected = "none"
    
    @State var firstSectionContent = "none"
    @State var secondSectionContent = "none"
    @State var thirdSectionContent = "none"
    @State var fourthSectionContent = "none"
    @State var fifthSectionContent = "none"
    
    public var body: some View {
        VStack(spacing: 0) {
            Text("Available Digits")
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Scroll left to see more")
                }
                ScrollView(.horizontal) {
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Start Guard")
                                .padding(.trailing, 31.0)
                            StartEndGuardDigit()
                        }
                        .padding()
                        .frame(height: 200, alignment: .topLeading)
                        .background(Color(UIColor.systemFill))
                        .cornerRadius(10.0)
                        .overlay(RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(currentlySelected == "Start Guard" ? Color(UIColor.systemBlue) : Color.black.opacity(0), lineWidth: 3))
                        .padding(5.0)
                        .animation(.easeInOut(duration: 0.2))
                        .onTapGesture(perform: {
                            if currentlySelected == "Start Guard" {
                                currentlySelected = "none"
                            } else {
                                currentlySelected = "Start Guard"
                            }
                            print(currentlySelected)
                        })
                        VStack(alignment: .leading) {
                            Text("End Guard")
                                .padding(.trailing, 31.0)
                            StartEndGuardDigit()
                        }
                        .padding()
                        .frame(height: 200, alignment: .topLeading)
                        .background(Color(UIColor.systemFill))
                        .cornerRadius(10.0)
                        .overlay(RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(currentlySelected == "End Guard" ? Color(UIColor.systemBlue) : Color.black.opacity(0), lineWidth: 3))
                        .padding(5.0)
                        .animation(.easeInOut(duration: 0.2))
                        .onTapGesture(perform: {
                            if currentlySelected == "End Guard" {
                                currentlySelected = "none"
                            } else {
                                currentlySelected = "End Guard"
                            }
                            print(currentlySelected)
                        })
                        VStack(alignment: .leading) {
                            Text("Middle Guard")
                                .padding(.trailing, 31.0)
                            MiddleGuardDigit()
                        }
                        .padding()
                        .frame(height: 200, alignment: .topLeading)
                        .background(Color(UIColor.systemFill))
                        .cornerRadius(10.0)
                        .overlay(RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(currentlySelected == "Middle Guard" ? Color(UIColor.systemBlue) : Color.black.opacity(0), lineWidth: 3))
                        .padding(5.0)
                        .animation(.easeInOut(duration: 0.2))
                        .onTapGesture(perform: {
                            if currentlySelected == "Middle Guard" {
                                currentlySelected = "none"
                            } else {
                                currentlySelected = "Middle Guard"
                            }
                            print(currentlySelected)
                        })
                        VStack(alignment: .leading) {
                            Text("Left Section")
                                .padding(.trailing, 31.0)
                            LeftSection()
                        }
                        .padding()
                        .frame(height: 200, alignment: .topLeading)
                        .background(Color(UIColor.systemFill))
                        .cornerRadius(10.0)
                        .overlay(RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(currentlySelected == "Left Section" ? Color(UIColor.systemBlue) : Color.black.opacity(0), lineWidth: 3))
                        .padding(5.0)
                        .animation(.easeInOut(duration: 0.2))
                        .onTapGesture(perform: {
                            if currentlySelected == "Left Section" {
                                currentlySelected = "none"
                            } else {
                                currentlySelected = "Left Section"
                            }
                            print(currentlySelected)
                        })
                        VStack(alignment: .leading) {
                            Text("Right Section")
                                .padding(.trailing, 31.0)
                            RightSection()
                        }
                        .padding()
                        .frame(height: 200, alignment: .topLeading)
                        .background(Color(UIColor.systemFill))
                        .cornerRadius(10.0)
                        .overlay(RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(currentlySelected == "Right Section" ? Color(UIColor.systemBlue) : Color.black.opacity(0), lineWidth: 3))
                        .padding(5.0)
                        .animation(.easeInOut(duration: 0.2))
                        .onTapGesture(perform: {
                            if currentlySelected == "Right Section" {
                                currentlySelected = "none"
                            } else {
                                currentlySelected = "Right Section"
                            }
                            print(currentlySelected)
                        })
                    }
                    .cornerRadius(10.0)
                }
            }
            .padding()
            .background(Color(UIColor.systemFill))
            .cornerRadius(15.0)
            .padding(.horizontal)
            .padding(.vertical, 8.0)
            Spacer()
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Press to select a digit from the top")
                        .font(.subheadline)
                    Text("Then, press the section that you want to use it")
                        .font(.subheadline)
                    Text("You can press a section to delete its content")
                        .font(.subheadline)
                    if currentlySelected == "none" {
                        Text("No digit is currently selected")
                            .font(.subheadline)
                    } else {
                        Text("Currently selected digit is \(currentlySelected)")
                            .font(.subheadline)
                    }
                }
                .animation(.easeInOut(duration: 0.2))
                Spacer()
                VStack(alignment: .trailing) {
                    Button("Reset", action: {
                        currentlySelected = "none"
                        firstSectionContent = "none"
                        secondSectionContent = "none"
                        thirdSectionContent = "none"
                        fourthSectionContent = "none"
                        fifthSectionContent = "none"
                    })
                    .padding(.horizontal, 20.0)
                    .padding(.vertical, 10.0)
                    .foregroundColor(Color.white)
                    .background(Color(UIColor.systemBlue))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                    Button("Check", action: {
                        if firstSectionContent == "Start Guard" && secondSectionContent == "Left Section" && thirdSectionContent == "Middle Guard" && fourthSectionContent == "Right Section" && fifthSectionContent == "End Guard" {
                            let success = NSLocalizedString("Perfect! You did it! 🎉 \n\n[**Next Page**](@next)", comment:"Let's continue!")
                            PlaygroundPage.current.assessmentStatus = .pass(message: success)
                        } else {
                            PlaygroundPage.current.assessmentStatus = .fail(hints: ["⚠️ Please check the barcode's content"], solution: nil)
                        }
                    })
                    .padding(.horizontal, 20.0)
                    .padding(.vertical, 10.0)
                    .foregroundColor(Color.white)
                    .background(Color(UIColor.systemBlue))
                    .cornerRadius(12)
                    .padding(.horizontal)
                }
            }
            .padding(.leading)
            Spacer()
            
            Text("Barcode")
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Scroll left to see more")
                }
                ScrollView(.horizontal) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("First Section")
                                .padding(.trailing, 31.0)
                            if firstSectionContent == "Start Guard" {
                                StartEndGuardDigit()
                            } else if firstSectionContent == "End Guard" {
                                StartEndGuardDigit()
                            } else if firstSectionContent == "Middle Guard" {
                                MiddleGuardDigit()
                            } else if firstSectionContent == "Left Section" {
                                LeftSection()
                            } else if firstSectionContent == "Right Section" {
                                RightSection()
                            }
                        }
                        .frame(height: 170, alignment: .topLeading)
                        .padding()
                        .background(Color(UIColor.systemFill))
                        .cornerRadius(10.0)
                        .padding(5.0)
                        .animation(.easeInOut(duration: 0.2))
                        .onTapGesture(perform: {
                            firstSectionContent = currentlySelected
                            currentlySelected = "none"
                        })
                        VStack(alignment: .leading) {
                            Text("Second Section")
                                .padding(.trailing, 31.0)
                            if secondSectionContent == "Start Guard" {
                                StartEndGuardDigit()
                            } else if secondSectionContent == "End Guard" {
                                StartEndGuardDigit()
                            } else if secondSectionContent == "Middle Guard" {
                                MiddleGuardDigit()
                            } else if secondSectionContent == "Left Section" {
                                LeftSection()
                            } else if secondSectionContent == "Right Section" {
                                RightSection()
                            }
                        }
                        .frame(height: 170, alignment: .topLeading)
                        .padding()
                        .background(Color(UIColor.systemFill))
                        .cornerRadius(10.0)
                        .padding(5.0)
                        .animation(.easeInOut(duration: 0.2))
                        .onTapGesture(perform: {
                            secondSectionContent = currentlySelected
                            currentlySelected = "none"
                        })
                        VStack(alignment: .leading) {
                            Text("Third Section")
                                .padding(.trailing, 31.0)
                            if thirdSectionContent == "Start Guard" {
                                StartEndGuardDigit()
                            } else if thirdSectionContent == "End Guard" {
                                StartEndGuardDigit()
                            } else if thirdSectionContent == "Middle Guard" {
                                MiddleGuardDigit()
                            } else if thirdSectionContent == "Left Section" {
                                LeftSection()
                            } else if thirdSectionContent == "Right Section" {
                                RightSection()
                            }
                        }
                        .frame(height: 170, alignment: .topLeading)
                        .padding()
                        .background(Color(UIColor.systemFill))
                        .cornerRadius(10.0)
                        .padding(5.0)
                        .animation(.easeInOut(duration: 0.2))
                        .onTapGesture(perform: {
                            thirdSectionContent = currentlySelected
                            currentlySelected = "none"
                        })
                        VStack(alignment: .leading) {
                            Text("Fourth Section")
                                .padding(.trailing, 31.0)
                            if fourthSectionContent == "Start Guard" {
                                StartEndGuardDigit()
                            } else if fourthSectionContent == "End Guard" {
                                StartEndGuardDigit()
                            } else if fourthSectionContent == "Middle Guard" {
                                MiddleGuardDigit()
                            } else if fourthSectionContent == "Left Section" {
                                LeftSection()
                            } else if fourthSectionContent == "Right Section" {
                                RightSection()
                            }
                        }
                        .frame(height: 170, alignment: .topLeading)
                        .padding()
                        .background(Color(UIColor.systemFill))
                        .cornerRadius(10.0)
                        .padding(5.0)
                        .animation(.easeInOut(duration: 0.2))
                        .onTapGesture(perform: {
                            fourthSectionContent = currentlySelected
                            currentlySelected = "none"
                        })
                        VStack(alignment: .leading) {
                            Text("Fifth Section")
                                .padding(.trailing, 31.0)
                            if fifthSectionContent == "Start Guard" {
                                StartEndGuardDigit()
                            } else if fifthSectionContent == "End Guard" {
                                StartEndGuardDigit()
                            } else if fifthSectionContent == "Middle Guard" {
                                MiddleGuardDigit()
                            } else if fifthSectionContent == "Left Section" {
                                LeftSection()
                            } else if fifthSectionContent == "Right Section" {
                                RightSection()
                            }
                        }
                        .frame(height: 170, alignment: .topLeading)
                        .padding()
                        .background(Color(UIColor.systemFill))
                        .cornerRadius(10.0)
                        .padding(5.0)
                        .animation(.easeInOut(duration: 0.2))
                        .onTapGesture(perform: {
                            fifthSectionContent = currentlySelected
                            currentlySelected = "none"
                        })
                        
                    }
                    .cornerRadius(10.0)
                }
            }
            .padding()
            .background(Color(UIColor.systemFill))
            .cornerRadius(15.0)
            .padding(.horizontal)
            .padding(.vertical, 8.0)
        }
        .padding()
    }
}
