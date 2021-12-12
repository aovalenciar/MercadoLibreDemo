//
//  Error+Extensions.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//

import Foundation
import Alamofire

extension Error {
    
    var isInternetError: Bool {

        guard let alamoError = self.asAFError?.underlyingError else {
            return (self.isInternetErrorCode)
        }
        
        return (alamoError.isInternetErrorCode)
    }
    
    var isInternetErrorCode: Bool {
        return (code == NSURLErrorNotConnectedToInternet || code == NSURLErrorDataNotAllowed)
    }
    
    var code: Int {
        return (self as NSError).code
    }
}

