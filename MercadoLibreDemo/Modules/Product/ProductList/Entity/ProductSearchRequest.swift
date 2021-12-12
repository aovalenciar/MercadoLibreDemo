//
//  ProductSearchRequest.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 10/12/21.
//

import Foundation

struct ProductSearchRequest: Codable {
    let query: String
    
    enum CodingKeys: String, CodingKey {
        case query = "q"
    }
}
