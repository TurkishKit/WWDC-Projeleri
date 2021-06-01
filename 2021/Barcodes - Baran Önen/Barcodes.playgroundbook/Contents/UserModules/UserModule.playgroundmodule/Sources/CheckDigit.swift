//
//  CheckDigit.swift
//  PlaygroundBook
//
//  Created by Baran Önen on 20.03.2021.
//

import SwiftUI
import PlaygroundSupport

public struct CheckDigitView: View {
    
    let barcodeContent: String
    var checkDigitContent: String {
        let digit = ((((Int(barcodeContent[0])! + Int(barcodeContent[2])! + Int(barcodeContent[4])! + Int(barcodeContent[6])! + Int(barcodeContent[8])! + Int(barcodeContent[10])!)) * 3) + ((Int(barcodeContent[1])! + Int(barcodeContent[3])! + Int(barcodeContent[5])! + Int(barcodeContent[7])! + Int(barcodeContent[9])!))) % 10
        if digit == 0 {
            return String(digit)
        } else {
            return String(10 - digit)
        }
    }
    
    public init(barcodeContent: String) {
        self.barcodeContent = barcodeContent
    }
    
    public var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(red: 70/255, green: 70/255, blue: 80/255), Color(red: 220/255, green: 150/255, blue: 150/255)]), startPoint: .bottomTrailing, endPoint: .topLeading)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    VStack(spacing: 0) {
                    HStack {
                        Text("Check Digit Generator")
                            .padding(.horizontal)
                    }
                    .frame(minWidth: 100, maxWidth: .infinity, minHeight: 50, maxHeight: 50, alignment: .center)
                    .background(Color(UIColor.secondarySystemGroupedBackground))
                    .opacity(0.7)
                    VStack {
                        if barcodeContent.count == 11 {
                            VStack {
                                Text("Barcode's content (without the check digit) is:")
                                    .padding(.horizontal)
                                    .padding(.top)
                                Text("\(barcodeContent)")
                                    .font(.system(.body, design: .monospaced))
                                Text("Check digit's value is \(checkDigitContent).")
                                    .padding()
                            }
                            .background(Color(UIColor.systemGroupedBackground))
                            .cornerRadius(10.0)
                            .padding([.horizontal, .bottom])
                            BarcodeDigit(value: checkDigitContent)
                                .colorInvert()
                                .onAppear(perform: {
                                    let success = NSLocalizedString("Click to learn about the guard digits! \n\n[**Next Page**](@next)", comment:"Let's Go!")
                                    PlaygroundPage.current.assessmentStatus = .pass(message: success)
                                })
                        } else {
                            Text("⚠️")
                                .font(.largeTitle)
                            Text("Barcode's content should have 11 digits. (Without the check digit)")
                                .font(.title)
                                .multilineTextAlignment(.center)
                                .padding()
                                .onAppear(perform: {
                                    PlaygroundPage.current.assessmentStatus = .fail(hints: ["⚠️ Barcode's content should have 11 digits. (Without the check digit)"], solution: nil)
                                })
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
