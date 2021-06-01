//
//  Random Number Generator.swift
//  UserModule
//
//  Created by Berkin Ceylan on 13.04.2021.
//

import SwiftUI
import PlaygroundSupport

// MARK: - Function
func randomNumberGenerator(min: Int, max: Int) -> () -> Int {
    var numbers: [Int] = []
    return {
        if numbers.isEmpty {
            numbers = Array(min ... max)
        }
        
        let index = Int(arc4random_uniform(UInt32(numbers.count)))
        return numbers.remove(at: index)
    }
}
