//
//  NibGettable.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//

import UIKit

protocol NibGettable {
    static func getNibView() -> UIView
    static var nibName: String {get}
}

extension NibGettable {
    
    static func getNibView() -> UIView {
        return Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)!.last as! UIView
    }
}
