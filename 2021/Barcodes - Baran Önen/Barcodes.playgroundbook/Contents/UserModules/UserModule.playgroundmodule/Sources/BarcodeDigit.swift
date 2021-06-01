//
//  BarcodeDigit.swift
//  PlaygroundBook
//
//  Created by Baran Önen on 18.03.2021.
//

import SwiftUI
import PlaygroundSupport

extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}

public struct BarcodeDigit: View {
    var value: String
    var firstSection: String {
        get {
            return String(value[0]) + String(value[2]) + String(value[3]) + String(value[4]) + String(value[5]) + String(value[6]) + String(value[7]) + String(value[8]) + String(value[9])
        }
    }
    public var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .frame(width: 6, height: 140, alignment: .center)
                .foregroundColor(Color.white)
                .padding(0)
            Rectangle()
                .frame(width: 6, height: 140, alignment: .center)
                .foregroundColor(String(value[0]) == "3" || String(value[0]) == "4" || String(value[0]) == "5" || String(value[0]) == "6" || String(value[0]) == "7" || String(value[0]) == "8" ? Color.black : Color.white)
                .padding(0)
            Rectangle()
                .frame(width: 6, height: 140, alignment: .center)
                .foregroundColor(String(value[0]) == "1" || String(value[0]) == "2" || String(value[0]) == "3" || String(value[0]) == "5" || String(value[0]) == "7" || String(value[0]) == "8" ? Color.black : Color.white)
                .padding(0)
            Rectangle()
                .frame(width: 6, height: 140, alignment: .center)
                .foregroundColor(String(value[0]) == "0" || String(value[0]) == "1" || String(value[0]) == "3" || String(value[0]) == "6" || String(value[0]) == "7" ? Color.black : Color.white)
                .padding(0)
            Rectangle()
                .frame(width: 6, height: 140, alignment: .center)
                .foregroundColor(String(value[0]) == "0" || String(value[0]) == "3" || String(value[0]) == "6" || String(value[0]) == "8" ? Color.black : Color.white)
                .padding(0)
            Rectangle()
                .frame(width: 6, height: 140, alignment: .center)
                .foregroundColor(String(value[0]) == "2" || String(value[0]) == "4" || String(value[0]) == "6" || String(value[0]) == "7" || String(value[0]) == "8" || String(value[0]) == "9" ? Color.black : Color.white)
                .padding(0)
            Rectangle()
                .frame(width: 6, height: 140, alignment: .center)
                .foregroundColor(String(value[0]) == "2" || String(value[0]) == "4" || String(value[0]) == "6" || String(value[0]) == "7" || String(value[0]) == "8" || String(value[0]) == "9" ? Color.black : Color.white)
                .padding(0)
            Rectangle()
                .frame(width: 6, height: 140, alignment: .center)
                .foregroundColor(Color.black)
                .padding(0)
        }
    }
}

public struct SmallBarcodeDigit: View {
    var value: String
    var firstSection: String {
        get {
            return String(value[0]) + String(value[2]) + String(value[3]) + String(value[4]) + String(value[5]) + String(value[6]) + String(value[7]) + String(value[8]) + String(value[9])
        }
    }
    public var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .frame(width: 2, height: 200, alignment: .center)
                .foregroundColor(Color.white)
                .padding(0)
            Rectangle()
                .frame(width: 2, height: 200, alignment: .center)
                .foregroundColor(String(value[0]) == "3" || String(value[0]) == "4" || String(value[0]) == "5" || String(value[0]) == "6" || String(value[0]) == "7" || String(value[0]) == "8" ? Color.black : Color.white)
                .padding(0)
            Rectangle()
                .frame(width: 2, height: 200, alignment: .center)
                .foregroundColor(String(value[0]) == "1" || String(value[0]) == "2" || String(value[0]) == "3" || String(value[0]) == "5" || String(value[0]) == "7" || String(value[0]) == "8" ? Color.black : Color.white)
                .padding(0)
            Rectangle()
                .frame(width: 2, height: 200, alignment: .center)
                .foregroundColor(String(value[0]) == "0" || String(value[0]) == "1" || String(value[0]) == "3" || String(value[0]) == "6" || String(value[0]) == "7" ? Color.black : Color.white)
                .padding(0)
            Rectangle()
                .frame(width: 2, height: 200, alignment: .center)
                .foregroundColor(String(value[0]) == "0" || String(value[0]) == "3" || String(value[0]) == "6" || String(value[0]) == "8" ? Color.black : Color.white)
                .padding(0)
            Rectangle()
                .frame(width: 2, height: 200, alignment: .center)
                .foregroundColor(String(value[0]) == "2" || String(value[0]) == "4" || String(value[0]) == "6" || String(value[0]) == "7" || String(value[0]) == "8" || String(value[0]) == "9" ? Color.black : Color.white)
                .padding(0)
            Rectangle()
                .frame(width: 2, height: 200, alignment: .center)
                .foregroundColor(String(value[0]) == "2" || String(value[0]) == "4" || String(value[0]) == "6" || String(value[0]) == "7" || String(value[0]) == "8" || String(value[0]) == "9" ? Color.black : Color.white)
                .padding(0)
            Rectangle()
                .frame(width: 2, height: 200, alignment: .center)
                .foregroundColor(Color.black)
                .padding(0)
        }
    }
}
