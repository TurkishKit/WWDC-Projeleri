//
//  SquareBoxView.swift
//  UserModule
//
//  Created by Berkin Ceylan on 13.04.2021.
//

import SwiftUI
import PlaygroundSupport

// MARK: - Square Box View
public struct SquareBoxView: View {
    
    // MARK: - Properties
    var number: Int
    var image: String
    
    // MARK: - Life Cycle
    init(number: Int, image: String) {
        self.number = number
        self.image = image
    }
    
    // MARK: - Content View
    public var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
            
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .cornerRadius(10)
            
            ZStack{
                Rectangle()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                
                Text("\(number)")
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                    .foregroundColor(.black)
            }
            .padding([.top, .trailing], 10.0)
        }
    }
}

