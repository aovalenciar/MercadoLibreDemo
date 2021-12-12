//
//  UINavigationItem+Extensions.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//

import UIKit

extension UINavigationItem {
    
    func removeBackButtonTitle() {
        backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
