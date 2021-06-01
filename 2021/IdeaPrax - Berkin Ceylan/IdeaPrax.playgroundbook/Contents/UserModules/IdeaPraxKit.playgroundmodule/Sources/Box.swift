//
//  Box.swift
//  UserModule
//
//  Created by Berkin Ceylan on 13.04.2021.
//

import SwiftUI
import PlaygroundSupport

// MARK: - Box
public struct Box: View {
    
    // MARK: - Properties
    var color: Color
    var number: Int
    
    // MARK: - Life Cycle
    init(number: Int, color: Color) {
        self.number = number
        self.color = color
    }
    
    public var body: some View {
        
        ZStack{
            
            Rectangle()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
                .foregroundColor(color)
            
            if number == 0 {
                Text("")
                    .foregroundColor(.black)
                    .font(.system(size: 70, weight: .semibold, design: .rounded))
            } else {
                Text("\(number)")
                    .foregroundColor(.black)
                    .font(.system(size: 70, weight: .semibold, design: .rounded))
            }
        }
    }
}
