//
//  Globals.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//

import Foundation
import Logging

let logger = Logger(label: "com.avalenciaapps.MercadoLibreDemo")


func afterDelay(seconds: TimeInterval, completionHandler: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completionHandler)
}
