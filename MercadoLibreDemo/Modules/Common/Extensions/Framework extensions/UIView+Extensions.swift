//
//  UIView+Extensions.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//

import UIKit

extension UIView {
    
    func addSubviewWithConstraints(subView: UIView) {
        addSubview(subView)
        subView.translatesAutoresizingMaskIntoConstraints = false
        subView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        subView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        subView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        subView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
