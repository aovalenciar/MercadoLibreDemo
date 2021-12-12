//
//  ProductResponse.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 10/12/21.
//

import Foundation

struct ProductResponse: Codable {
    let products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case products = "results"
    }
}
