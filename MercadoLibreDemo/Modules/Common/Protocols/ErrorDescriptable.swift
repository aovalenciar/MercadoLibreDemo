//
//  ErrorDescriptable.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//

import Foundation

protocol ErrorDescriptable {
    var title: String {get}
    var message: String {get}
    var imageName: String? {get}
}
