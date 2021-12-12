//
//  BaseApi.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 10/12/21.
//

import Foundation

class BaseApi {
    
    //MARK: - Enviroment
    
    static var environment: Environment {
        return .production
    }
    
    //MARK: - Computed properties
    
    static var baseURL: String {
        return environment.url
    }
}

//MARK: - Private enums

extension BaseApi {
    
    enum Environment {
        
        case production
        case dev
        
        var url: String {
            switch self {
            case .production:
                return "https://api.mercadolibre.com"
            case .dev:
                //simulate that we have a dev environment
                return  "https://api.mercadolibre.com"
            }
        }
    }
}
