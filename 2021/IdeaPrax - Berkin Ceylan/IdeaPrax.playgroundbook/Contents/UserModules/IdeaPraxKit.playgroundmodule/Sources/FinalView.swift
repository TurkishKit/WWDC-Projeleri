//
//  FinalView.swift
//  UserModule
//
//  Created by Berkin Ceylan on 13.04.2021.
//

import SwiftUI
import PlaygroundSupport

// MARK: - Final View
public struct FinalView: View {
    
    // MARK: - Life Cycle
    public init() {}
    
    // MARK: - Content View
    public var body: some View {
        ZStack{
            
            // Background
            Color.black
            
            VStack{
                
                // Image
                Image("final")
                    .resizable()
                    .scaledToFit()
                
                // Text: Title
                Text("That's It!")
                    .font(.system(size: 50, weight: .semibold, design: .default))
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                
                // Text: subHeadline
                Text("Thank you for your interest.")
                    .font(.system(size: 20, weight: .regular, design: .default))
                    .foregroundColor(Color.gray)
                    .padding(.bottom, 100)
            }
        }
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView()
    }
}
