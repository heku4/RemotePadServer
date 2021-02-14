//
//  File.swift
//  
//
//  Created by Nikita Volkov on 11.02.2021.
//

import Vapor

struct Keyboard: Content {
    let tappedKey: UInt16?
    let secondPressedKey: UInt16?
    let firstPressedKey: UInt16?
    let doubleCombination: Bool
    let trippleCombination: Bool
}
