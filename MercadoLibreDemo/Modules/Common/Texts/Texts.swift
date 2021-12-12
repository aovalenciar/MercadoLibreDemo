//
//  Texts.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//

import Foundation

class Texts {
    class General {}
    class ProductList {}
}

//MARK: - Texts Shows

extension Texts.General {
    
    static var ok: String {
        return "OK"
    }

    static var oops: String {
        return "Oops, algo salió mal!"
    }
    
    static var internetErrorMessage: String {
        return "No pudimos establecer la conexión con el servidor. Por favor verifica tu conexión a Internet."
    }
    
    static var generalErrorMessage: String {
        return "Ocurrió un error al consultar el servicio. Haz click para intentar nuevamente"
    }
}

extension Texts.ProductList {
    
    static var searchBarPlaceHolder: String {
        return "Buscar en Mercado Libre"
    }
    
    static var withouResultsTitle: String {
        return "No encontramos publicaciones"
    }
    
    static var withouResultsMessage: String {
        return "Revisa que la palabra esté bien escrita. También puedes probar con menos términos o más generales."
    }
}
