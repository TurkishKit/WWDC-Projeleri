//
//  DigitsView.swift
//  PlaygroundBook
//
//  Created by Baran Önen on 18.03.2021.
//

import SwiftUI
import PlaygroundSupport

public struct DigitsView: View {
    
    let value: Int
    @State private var location: String = "left"
        
    public init(value: Int) {
        self.value = value
    }

    public var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(red: 10/255, green: 140/255, blue: 80/255), Color(red: 38/255, green: 60/255, blue: 127/255)]), startPoint: .top, endPoint: .bottom)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    VStack(spacing: 0) {
                    HStack {
                        Text("Barcode Digit Generator")
                            .padding(.horizontal)
                    }
                    .frame(minWidth: 100, maxWidth: .infinity, minHeight: 50, maxHeight: 50, alignment: .center)
                    .background(Color(UIColor.secondarySystemGroupedBackground))
                    .opacity(0.7)
                    VStack {
                        /*
                        Picker("Digit", selection: $value) {
                            ForEach(0 ..< 10) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                         */
                        if self.location == "left" || self.location == "right" {
                            if self.value > -1 && self.value < 10 {
                                VStack {
                                    
                                   Picker("Digit's position", selection: $location) {
                                       Text("Left Side").tag("left")
                                       Text("Right Side").tag("right")
                                   }
                                   .padding(.horizontal)
                                   .padding(.top)
                                   .pickerStyle(SegmentedPickerStyle())
                                    
                                    Text("Digit's value is \(value).")
                                        .padding()
                                    Text("It's located in the \(location) side of the barcode.")
                                        .padding(.horizontal)
                                        .padding(.bottom)
                                }
                                .background(Color(UIColor.systemGroupedBackground))
                                .cornerRadius(10.0)
                                .padding([.horizontal, .bottom])
                                .onAppear(perform: {
                                    let success = NSLocalizedString("Click to learn about the check digit! \n\n[**Next Page**](@next)", comment:"Let's Go!")
                                    PlaygroundPage.current.assessmentStatus = .pass(message: success)
                                })
                            }
                        }
                        HStack {
                            Spacer()
                            if self.value > -1 && self.value < 10 {
                                if self.location == "left" {
                                    BarcodeDigit(value: String(value))
                                        .padding([.leading, .bottom, .trailing])
                                } else if self.location == "right" {
                                    BarcodeDigit(value: String(value))
                                        .padding([.leading, .bottom, .trailing])
                                        .colorInvert()
                                } else {
                                    VStack {
                                    Text("⚠️")
                                        .font(.largeTitle)
                                    Text("Variable 'location' should be either 'left' or 'right'. Try again.")
                                        .font(.title)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                        .onAppear(perform: {
                                            PlaygroundPage.current.assessmentStatus = .fail(hints: ["⚠️ Variable 'location' should be either 'left' or 'right'. Try again."], solution: nil)
                                        })
                                    }
                                }
                            } else {
                                VStack {
                                Text("⚠️")
                                    .font(.largeTitle)
                                Text("Variable 'value' should have a value between 0 and 9. Try again.")
                                    .font(.title)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .onAppear(perform: {
                                        PlaygroundPage.current.assessmentStatus = .fail(hints: ["⚠️ Variable 'value' should have a value between 0 and 9. Try again."], solution: nil)
                                    })
                                }
                            }
                            Spacer()
                        }
                        }
                    .frame(minWidth: 10, maxWidth: .infinity, minHeight: 380, maxHeight: 380, alignment: .center)
                    .background(Color(UIColor.secondarySystemBackground))
                    }
                    .frame(minWidth: 10, maxWidth: .infinity, minHeight: 430, maxHeight: 430, alignment: .top)
                    .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
                    .padding(.horizontal, 80.0)
                    Spacer()
                }
                Spacer()
            }
            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity, alignment: .center)
        }
    }
}
