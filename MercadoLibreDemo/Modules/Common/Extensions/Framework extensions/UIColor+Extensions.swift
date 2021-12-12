//
//  UIColor+Extensions.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 10/12/21.
//
//

import UIKit

extension UIColor {
    
    static var navBarColor: UIColor {
        return UIColor(hexString: "#fcdc17")
    }
    
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        var cleanedHexString = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexString.hasPrefix("#") {
            cleanedHexString = String(hexString.dropFirst())
        }
 
        var rgbValue: UInt64 = 0
        Scanner(string: cleanedHexString).scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue >> 16) & 0xff) / 255.0
        let green = CGFloat((rgbValue >> 08) & 0xff) / 255.0
        let blue = CGFloat((rgbValue >> 00) & 0xff) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
