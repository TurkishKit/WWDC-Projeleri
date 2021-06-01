//
//  IntroductionView.swift
//  UserModule
//
//  Created by Berkin Ceylan on 13.04.2021.
//

import SwiftUI
import PlaygroundSupport

// MARK: - Introduction View
public struct IntroductionView: View {
    
    // MARK: - Life Cycle
    public init() {}
    
    // MARK: - Content View
    public var body: some View {
        ZStack{
            
            // Background
            Color.black
            
            VStack{
                
                // Image
                Image("wwdc")
                    .resizable()
                    .scaledToFit()
                
                // Text: Title
                Text("Welcome to IdeaPrax.")
                    .font(.system(size: 50, weight: .semibold, design: .default))
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                
                // Text: subHeadline
                Text("Created by Berkin C.")
                    .font(.system(size: 20, weight: .regular, design: .default))
                    .foregroundColor(Color.gray)
                    .padding(.bottom, 100)
            }
        }
    }
}
