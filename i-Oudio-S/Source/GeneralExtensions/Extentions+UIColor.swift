//  Extensions+UIColor.swift
//  ToyProject@Crecker
//
//  Created by elesahich on 2020/05/27.
//  Copyright © 2020 elesahich. All rights reserved.
//
import UIKit

extension UIColor {
    
    @nonobjc class var white: UIColor {
        return UIColor(white: 1.0, alpha: 1.0)
    }
    
    @nonobjc class var black: UIColor {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
    }
    
    @nonobjc class var mainClearWhite: UIColor {
        return UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
    }
    
    @nonobjc class var mainClearBlack: UIColor {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
    }
    
    @nonobjc class var mainBlue: UIColor {
        return UIColor(red: 18.0 / 255.0, green: 109.0 / 255.0, blue: 167.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var mainPurpule: UIColor {
        return UIColor(red: 115.0 / 255.0, green: 75.0 / 255.0, blue: 249.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var mainGray1: UIColor {
        return UIColor(red: 126.0 / 255.0, green: 126.0 / 255.0, blue: 128.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var mainGray2: UIColor {
        return UIColor(red: 213.0 / 255.0, green: 213.0 / 255.0, blue: 224.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var mainGrayBackground: UIColor {
        return UIColor(red: 33.0 / 255.0, green: 33.0 / 255.0, blue: 33.0 / 255.0, alpha: 1.0)
    }
    
    
}

extension UIColor {
    convenience init(hexString: String) {
        var hexFormatted: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: CGFloat(1.0))
    }
    
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}


