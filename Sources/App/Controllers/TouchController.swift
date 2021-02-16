//
//  File.swift
//  
//
//  Created by Nikita Volkov on 16.02.2021.
//

import Foundation

final class TouchController {
    public func moveCursor(posX: Double, posY: Double) {  // maxX ~ 1700  maxY ~ 1050
        let coordinates: CGPoint = CGPoint(x: posX, y: posY)
        let mouseType: CGEventType = CGEventType.init(rawValue: 5)! //mouse moved
        let mouseButton: CGMouseButton = CGMouseButton.init(rawValue: 0)! //left button for three-button mouse
        let mouseMove = CoreGraphics.CGEvent(mouseEventSource: nil, mouseType: mouseType, mouseCursorPosition: coordinates, mouseButton: mouseButton)
        mouseMove?.flags = CGEventFlags.init()
        mouseMove?.post(tap: CGEventTapLocation.cghidEventTap)
    }
}
