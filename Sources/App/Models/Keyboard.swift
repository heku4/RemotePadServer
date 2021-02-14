//
//  File.swift
//  
//
//  Created by Nikita Volkov on 11.02.2021.
//

import Vapor

struct Keyboard: Content {
    let pressedKey: UInt16
    let tappedKey: UInt16?
    let tappedSecondKey: UInt16?
    let doubleCombination: Bool
    let trippleCombination: Bool
}
