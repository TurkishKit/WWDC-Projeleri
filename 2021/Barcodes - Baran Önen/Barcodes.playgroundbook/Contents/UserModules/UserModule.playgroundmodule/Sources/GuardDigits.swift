//
//  GuardDigits.swift
//  PlaygroundBook
//
//  Created by Baran Önen on 7.04.2021.
//

import SwiftUI
import PlaygroundSupport

public struct StartEndGuardDigit: View {
    public var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .frame(width: 6, height: 140, alignment: .center)
                .foregroundColor(Color.black)
                .padding(0)
            Rectangle()
                .frame(width: 6, height: 140, alignment: .center)
                .foregroundColor(Color.white)
                .padding(0)
            Rectangle()
                .frame(width: 6, height: 140, alignment: .center)
                .foregroundColor(Color.black)
                .padding(0)
        }
    }
}

public struct MiddleGuardDigit: View {
    public var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .frame(width: 6, height: 140, alignment: .center)
                .foregroundColor(Color.white)
                .padding(0)
            Rectangle()
                .frame(width: 6, height: 140, alignment: .center)
                .foregroundColor(Color.black)
                .padding(0)
            Rectangle()
                .frame(width: 6, height: 140, alignment: .center)
                .foregroundColor(Color.white)
                .padding(0)
            Rectangle()
                .frame(width: 6, height: 140, alignment: .center)
                .foregroundColor(Color.black)
                .padding(0)
            Rectangle()
                .frame(width: 6, height: 140, alignment: .center)
                .foregroundColor(Color.white)
                .padding(0)
        }
    }
}
