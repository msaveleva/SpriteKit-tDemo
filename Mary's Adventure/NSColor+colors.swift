//
//  NSColor+colors.swift
//  SpriteKittDemo
//
//  Created by MariaSaveleva on 31/12/2016.
//  Copyright © 2016 MariaSaveleva. All rights reserved.
//

import Foundation
import AppKit

extension NSColor {

    class func platformColor() -> NSColor {
        return NSColor().hexStringToUIColor(hex: "#ffffff")
    }

    class func floorColor() -> NSColor {
        return NSColor().hexStringToUIColor(hex: "#eaf4f4")
    }

    class func groundColor() -> NSColor {
        return NSColor().hexStringToUIColor(hex: "#007ea7")
    }

    class func coinsTextColor() -> NSColor {
        return NSColor().hexStringToUIColor(hex: "#fcd734")
    }

    private func hexStringToUIColor(hex:String) -> NSColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        cString.remove(at: cString.startIndex)

        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)

        return NSColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
