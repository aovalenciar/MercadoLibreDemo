//
//  ApiResponse.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 10/12/21.
//

import Foundation

enum ApiResponse<GenericSuccess> {
    case success(GenericSuccess)
    case error(Error)
}
