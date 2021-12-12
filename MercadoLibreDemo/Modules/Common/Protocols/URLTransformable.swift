//
//  URLTransformable.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//

import Foundation

protocol URLTransformable {
    var urlValue: URL? {get}
    var imageName: String {get}
}

extension URLTransformable {
    
    var urlValue: URL? {
        return nil
    }
    
    var imageName: String {
        return ""
    }
}
