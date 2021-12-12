//
//  Product.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 10/12/21.
//

import Foundation

struct Product: Codable {
    let id : String
    let siteId: String
    let title: String
    var price: Float
    var currencyId: String
    var thumbnail: URL?
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
        case thumbnail = "thumbnail"
        case acceptsMercadopago = "accepts_mercadopago"
    }
}
