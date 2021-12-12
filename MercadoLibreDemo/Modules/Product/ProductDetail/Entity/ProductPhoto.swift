//
//  ProductPhoto.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//

import Foundation

struct ProductPhoto: Codable, URLTransformable {
    var id: String
    var url: URL?
    var secureUrl: URL?
    
    var urlValue: URL? {
        return secureUrl
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case url = "url"
        case secureUrl = "secure_url"
    }
}
