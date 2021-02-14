//
//  File.swift
//  
//
//  Created by Nikita Volkov on 14.02.2021.
//

import Vapor

final class KeyboardController {
    
    public func pressKey(keyCode: UInt16) {
        self.keyboardKeyDown(letterKeyCode: keyCode)
        self.keyboardKeyUp(letterKeyCode: keyCode)
    }
    
    public func keyboardDoubleCombination(pressedKey:CGKeyCode, tappedKey:CGKeyCode){
        self.keyboardKeyDown(letterKeyCode: pressedKey) //cmd down
        self.keyboardKeyDown(letterKeyCode: tappedKey)  // space down
        self.keyboardKeyUp(letterKeyCode: tappedKey)  //space up
        self.keyboardKeyUp(letterKeyCode: pressedKey) // cmd up = cmd+space
    }
    
    public func keyboardTrippleCombination(firstPressedKey:CGKeyCode, secondPressedKey: CGKeyCode, tappedKey:CGKeyCode){
        self.keyboardKeyDown(letterKeyCode: firstPressedKey) //cmd down
        self.keyboardKeyDown(letterKeyCode: secondPressedKey) //cmd down
        self.keyboardKeyDown(letterKeyCode: tappedKey)  // space down
        self.keyboardKeyUp(letterKeyCode: tappedKey)  //space up
        self.keyboardKeyUp(letterKeyCode: firstPressedKey) // cmd up = cmd+space
        self.keyboardKeyUp(letterKeyCode: secondPressedKey) // cmd up = cmd+space
    }
    
    private func keyboardKeyDown(letterKeyCode: CGKeyCode) {
        let keyboardKeyDown = CoreGraphics.CGEvent(keyboardEventSource: nil, virtualKey: letterKeyCode, keyDown: true)
        keyboardKeyDown?.flags = CGEventFlags.init() //additional states for key press
        keyboardKeyDown?.post(tap: CGEventTapLocation.cghidEventTap)
    }
    private func keyboardKeyUp(letterKeyCode: CGKeyCode) {
        let keyboardKeyUp = CoreGraphics.CGEvent(keyboardEventSource: nil, virtualKey: letterKeyCode, keyDown: false)
        keyboardKeyUp?.flags = CGEventFlags.init()
        keyboardKeyUp?.post(tap: CGEventTapLocation.cghidEventTap)
    }
    
    
}
