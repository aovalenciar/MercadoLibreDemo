//
//  EmptyDataSetHelper.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//

import UIKit
import DZNEmptyDataSet

typealias AttributedStringDict = [NSAttributedString.Key: Any]

class EmptyDataSetHelper {

    class func getAttributedDescription(font: UIFont, color: UIColor, text: String) -> NSAttributedString {
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineBreakMode = .byWordWrapping
        paragraph.alignment = .center
        let attributes: AttributedStringDict = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.paragraphStyle: paragraph]
        return NSAttributedString(string: text, attributes: attributes)
        
    }
    
    class func getAttributedTitle(font: UIFont, color: UIColor, text: String) -> NSAttributedString {
        let attributes: AttributedStringDict = [.font: font, .foregroundColor: color]
        return NSAttributedString(string: text, attributes: attributes)
    }
    
    class func getAttributedButtonTitle(font: UIFont, color: UIColor, text: String) -> NSAttributedString {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let attributes: AttributedStringDict = [.font: font, .foregroundColor: color, .paragraphStyle: paragraphStyle]
        return NSAttributedString(string: text, attributes: attributes)
    }
    
    class var imageAnimation: CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "transform")
        animation.fromValue = NSValue(caTransform3D: CATransform3DIdentity)
        animation.toValue = NSValue(caTransform3D: CATransform3DMakeRotation(.pi/2, 0.0, 0.0, 1.0))
        animation.duration = 0.25
        animation.isCumulative = true
        animation.repeatCount = MAXFLOAT
        return animation
    }
    
    class var centerVerticalOffset: CGFloat {
        return 0
    }
    
    class var centerSpaceHeight: CGFloat {
        return 0
    }
}
