//
//  ProductDetailError.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//

import Foundation

enum ProductDetailError: Error, ErrorDescriptable {
    case noInternet
    case general
    
    init(error: Error) {
        if error.isInternetError {
            self = .noInternet
        } else {
            self = .general
        }
    }
    
    var title: String {
        switch self {
        case .noInternet:
            return Texts.General.oops
        case .general:
            return Texts.General.oops
        }
    }
    
    var message: String {
        switch self {
        case .noInternet:
            return Texts.General.internetErrorMessage
        case .general:
            return Texts.General.generalErrorMessage
        }
    }
    
    var imageName: String? {
        switch self {
        case .noInternet:
            return "wifi"
        case .general:
            return nil
        }
    }
}
