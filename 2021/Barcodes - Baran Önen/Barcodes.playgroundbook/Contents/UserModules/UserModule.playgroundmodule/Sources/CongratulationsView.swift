//
//  CongratulationsView.swift
//  PlaygroundBook
//
//  Created by Baran Önen on 14.04.2021.
//

import SwiftUI
import PlaygroundSupport

public struct CongratulationsView: View {
    
    let emojis = ["🚀", "💻", "🎉", "💪", "✅", "🕹", "🏆", "⌨️", "🎯", "👾", "🌈", "🔥", "🥇", "⌚️", "📈", "🆒", "🏴‍☠️", "📱"]
    @State var currentEmoji = ""
    
    public init() {}
    
    public var body: some View {
        Text("\(currentEmoji)")
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .font(.system(size: 70.0))
            .background(Color(UIColor.systemBackground))
            .foregroundColor(Color(UIColor.label))
            .onAppear(perform: {
                DispatchQueue.global(qos: .background).async {
                    while true {
                        for emoji in emojis {
                            currentEmoji = emoji
                            usleep(750000)
                        }
                    }
                }
            })
    }
}
