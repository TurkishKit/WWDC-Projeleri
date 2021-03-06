//
//  CongratulationsView.swift
//  PlaygroundBook
//
//  Created by Baran Γnen on 14.04.2021.
//

import SwiftUI
import PlaygroundSupport

public struct CongratulationsView: View {
    
    let emojis = ["π", "π»", "π", "πͺ", "β", "πΉ", "π", "β¨οΈ", "π―", "πΎ", "π", "π₯", "π₯", "βοΈ", "π", "π", "π΄ββ οΈ", "π±"]
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
