//
//  CustomNavigationController.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 10/12/21.
//
//

import UIKit

class CustomNavigationController: UINavigationController {

    //MARK: - Status Bar
    
    override var childForStatusBarStyle: UIViewController? {
        return nil
    }
    
    //MARK: - Status Bar
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}
