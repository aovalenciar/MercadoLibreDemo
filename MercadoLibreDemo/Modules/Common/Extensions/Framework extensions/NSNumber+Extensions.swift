//
//  NSNumber+Extensions.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//

import Foundation

extension NSNumber {
    func toCurrencyFormat(code: String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = code
        formatter.maximumFractionDigits = 0
        formatter.locale = Locale(identifier: "es_MX")
        return formatter.string(from: self) ?? ""
    }
}
