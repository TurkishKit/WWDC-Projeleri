//
//  ModalView.swift
//  UserModule
//
//  Created by Berkin Ceylan on 13.04.2021.
//

import SwiftUI
import PlaygroundSupport

// MARK: - Modal View
public struct ModalView: View {
    
    // MARK: - Properties
    var percent: Int
    
    // MARK: - Life Cycle
    public init(percent: Int) {
        self.percent = percent
    }
    
    // MARK: - Content View
    public var body: some View {
        
        VStack{
            
            // MARK: - Title
            Text("Test Results.")
                .font(.system(size: 50, weight: .semibold, design: .default))
                .padding(.top, 100.0)
            
            // MARK: - ProgressBar
            ProgressBar(percent: percent)
                .padding(80.0)
            
            HStack{
                VStack(alignment: .leading, spacing: 10){
                    
                    // HStack - 1
                    HStack{
                        
                        // - InfoText
                        Text("%70")
                            .font(.system(size: 20, weight: .semibold, design: .default))
                        
                        // - Icon
                        Image(systemName: "chevron.up")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .foregroundColor(.green)
                        
                        // - InfoText
                        Text("Congratulations. Looks fine.")
                            .font(.system(size: 20, weight: .semibold, design: .default))
                            .foregroundColor(.gray)
                            .padding(.leading, 20.0)
                        
                    }
                    
                    // HStack - 2
                    HStack{
                        
                        // - InfoText
                        Text("%40")
                            .font(.system(size: 20, weight: .semibold, design: .default))
                        
                        // MARK: - InfoIcon
                        Image(systemName: "chevron.down")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .foregroundColor(.red)
                        
                        // - InfoText
                        Text("It is recommended that you see a doctor.")
                            .font(.system(size: 20, weight: .semibold, design: .default))
                            .foregroundColor(.gray)
                            .padding(.leading, 20.0)
                    }
                }
                
            }.padding(.bottom, 100.0)
        }
    }
}
