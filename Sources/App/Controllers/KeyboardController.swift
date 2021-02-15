//
//  File.swift
//  
//
//  Created by Nikita Volkov on 14.02.2021.
//

import Vapor

final class KeyboardController {
    
    private let modificatorKey: [UInt16?: String] = [55: "command", 58: "option", 59: "control", 63: "fn", 57: "shift", nil: "err"]

    public func pressKey(keyCode: UInt16) {
        self.keyboardKeyDown(letterKeyCode: keyCode, modificatorKeyCode: nil)
        self.keyboardKeyUp(letterKeyCode: keyCode)
    }
    public func keyboardDoubleCombination(pressedKey:CGKeyCode, modificatorKey:UInt16){
        self.keyboardKeyDown(letterKeyCode: pressedKey, modificatorKeyCode: modificatorKey)
        self.keyboardKeyUp(letterKeyCode: pressedKey)
    }
    
    private func keyboardKeyDown(letterKeyCode: CGKeyCode, modificatorKeyCode: UInt16?) -> String {
        let keyboardKeyDown = CoreGraphics.CGEvent(keyboardEventSource: nil, virtualKey: letterKeyCode, keyDown: true)
        
        let modificator = self.modificatorKey[modificatorKeyCode!]
        switch modificator {
        case "command":
            keyboardKeyDown?.flags = CGEventFlags.maskCommand
        case "option":
            keyboardKeyDown?.flags = CGEventFlags.maskAlternate
        case "control":
            keyboardKeyDown?.flags = CGEventFlags.maskControl
        case "fn":
            keyboardKeyDown?.flags = CGEventFlags.maskSecondaryFn
        case "shift":
            keyboardKeyDown?.flags = CGEventFlags.maskShift
        case "err":
            return "err"
        default:
            keyboardKeyDown?.flags = CGEventFlags.init()
        }
        keyboardKeyDown?.post(tap: CGEventTapLocation.cghidEventTap)
        return "done"
    }
    
    private func keyboardKeyUp(letterKeyCode: CGKeyCode) {
        let keyboardKeyUp = CoreGraphics.CGEvent(keyboardEventSource: nil, virtualKey: letterKeyCode, keyDown: false)
        keyboardKeyUp?.flags = CGEventFlags.init()
        keyboardKeyUp?.post(tap: CGEventTapLocation.cghidEventTap)
    }
}
