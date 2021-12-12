//
//  ProductDetailRequest.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//

import Foundation

struct ProductDetailRequest: Codable {
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case id = "ids"
    }
}
