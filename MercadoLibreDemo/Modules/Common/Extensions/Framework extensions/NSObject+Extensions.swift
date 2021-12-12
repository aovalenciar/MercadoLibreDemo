//
//  NSObject+Extensions.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 10/12/21.
//
//

import Foundation

extension NSObject {

    static var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }
}
