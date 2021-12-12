//
//  AppAppearance.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 10/12/21.
//

import UIKit

class AppAppearance {
    
    public static func applyAppAppearance() {
        AppAppearance.customizeNavBar()
    }
  
    fileprivate static func customizeNavBar() {

        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = .navBarColor
        navigationBarAppearance.tintColor = .white
        
        navigationBarAppearance.isTranslucent = false
        
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .medium)]
    }
}
