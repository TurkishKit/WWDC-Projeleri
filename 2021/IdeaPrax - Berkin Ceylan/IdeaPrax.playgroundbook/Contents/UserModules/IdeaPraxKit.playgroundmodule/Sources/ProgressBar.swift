//
//  ProgressBar.swift
//  UserModule
//
//  Created by Berkin Ceylan on 13.04.2021.
//

import SwiftUI
import PlaygroundSupport

// MARK: - Progress Bar
public struct ProgressBar: View {
    
    // MARK: - Properties
    var percent: Int
    var lineWidth: CGFloat = 25.0
    
    @State var progress: Float = 0
    
    // MARK: - Life Cycle
    init(percent: Int) {
        self.percent = percent
    }
    
    // MARK: - Content View
    public var body: some View {
        
        ZStack {
            
            // - Circle
            Circle()
                .stroke(lineWidth: lineWidth)
                .opacity(0.3)
                .foregroundColor(Color.gray)
            
            // - Circle
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.green)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.easeInOut(duration: 1.5))
            
            // - Text
            Text(String(format: "%.0f", min(self.progress, 1.0)*100.0))
                .font(.system(size: 125, weight: .semibold, design: .rounded))
                .bold()
        }
        .onAppear{
            progress = Float(percent)/100
        }
    }
}
