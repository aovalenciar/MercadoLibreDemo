//
//  ProductDetail.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//

import Foundation

struct ProductDetail: Codable {
    let id : String
    let siteId: String
    let title: String
    var price: Float
    var currencyId: String
    var availableQuantity: Int
    var pictures: [ProductPhoto]
    var acceptsMercadopago: Bool
    
    var formattedPrice: String {
        return (price as NSNumber).toCurrencyFormat(code: currencyId)
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case siteId = "site_id"
        case title = "title"
        case price = "price"
        case currencyId = "currency_id"
        case availableQuantity = "available_quantity"
        case pictures = "pictures"
        case acceptsMercadopago = "accepts_mercadopago"
    }
}
