//
//  UIColor+colors.swift
//  SpriteKittDemo
//
//  Created by MariaSaveleva on 23/12/2016.
//  Copyright © 2016 MariaSaveleva. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

    class func platformColor() -> UIColor {
        return UIColor().hexStringToUIColor(hex: "#ffffff")
    }

    class func floorColor() -> UIColor {
        return UIColor().hexStringToUIColor(hex: "#eaf4f4")
    }

    class func groundColor() -> UIColor {
        return UIColor().hexStringToUIColor(hex: "#007ea7")
    }

    class func coinsTextColor() -> UIColor {
        return UIColor().hexStringToUIColor(hex: "#fcd734")
    }

    private func hexStringToUIColor(hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        cString.remove(at: cString.startIndex)

        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}

//Nice extension, should use it in future version instead of hexStringToUIColor(hex:String) -> UIColor
//extension UIColor {
//
//    convenience init(red: Int, green: Int, blue: Int) {
//        assert(red >= 0 && red <= 255, "Invalid red component")
//        assert(green >= 0 && green <= 255, "Invalid green component")
//        assert(blue >= 0 && blue <= 255, "Invalid blue component")
//
//        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
//    }
//
//    convenience init(netHex:Int) {
//        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
//    }
//
//}
