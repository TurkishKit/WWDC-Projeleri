//
//  GuardDigitsView.swift
//  PlaygroundBook
//
//  Created by Baran Önen on 7.04.2021.
//

import SwiftUI
import PlaygroundSupport

public struct GuardDigitsView: View {
    
    @State private var digit = "Left"
    
    @Environment(\.colorScheme) var colorScheme
    
    var digits = ["Left", "Middle", "Right"]
    
    public init() {}
    
    public var body: some View {
        ZStack {
            if colorScheme == .dark {
                LinearGradient(gradient: Gradient(colors: [Color(red: 35/255, green: 35/255, blue: 80/255), Color(red: 93/255, green: 65/255, blue: 114/255), Color(red: 40/255, green: 8/255, blue: 14/255)]), startPoint: .topTrailing, endPoint: .bottomLeading)
            } else {
                LinearGradient(gradient: Gradient(colors: [Color(red: 63/255, green: 125/255, blue: 184/255), Color(red: 204/255, green: 97/255, blue: 107/255), Color(red: 35/255, green: 67/255, blue: 106/255)]), startPoint: .topTrailing, endPoint: .bottomLeading)
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    VStack(spacing: 0) {
                    HStack {
                        Text("Guard Digits")
                            .padding(.horizontal)
                    }
                    .frame(minWidth: 100, maxWidth: .infinity, minHeight: 50, maxHeight: 50, alignment: .center)
                    .background(Color(UIColor.secondarySystemGroupedBackground))
                    .opacity(0.7)
                    VStack {
                        Picker("Guard digit's location", selection: $digit) {
                            ForEach(digits, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(minWidth: 160, maxWidth: 250, alignment: .center)
                        .padding()
                        HStack {
                        if digit == "Left" {
                            StartEndGuardDigit()
                        } else if digit == "Right" {
                            StartEndGuardDigit()
                        } else if digit == "Middle" {
                            MiddleGuardDigit()
                        }
                        }
                        .animation(.easeInOut(duration: 0.2))
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
