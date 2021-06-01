//
//  RectangleBoxView.swift
//  UserModule
//
//  Created by Berkin Ceylan on 13.04.2021.
//

import SwiftUI
import PlaygroundSupport

// MARK: - Rectangle Box View
public struct RectangleBoxView: View {
    
    // MARK: - Properties
    var color: Color
    var number: String
    var textSize: CGFloat = 70
    var width: CGFloat = 300
    var height: CGFloat = 150
    
    // MARK: - Life Cycle
    public init(number: String, color: Color) {
        self.color = color
        self.number = number
    }
    
    // MARK: - Content View
    public var body: some View {
        ZStack{
            
            // Rectangle
            Rectangle()
                .frame(width: width, height: height)
                .cornerRadius(10)
                .foregroundColor(color)
            
            Text(number)
                .font(.system(size: textSize, weight: .semibold, design: .rounded))
                .foregroundColor(.black)
        }
    }
}
