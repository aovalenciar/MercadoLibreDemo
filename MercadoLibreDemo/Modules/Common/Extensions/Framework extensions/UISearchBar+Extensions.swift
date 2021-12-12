//
//  UISearchBar+Extensions.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//

import UIKit

extension UISearchBar {
    static func getRounded(placeholder: String? = nil, backgroundColor: UIColor = .white) -> UISearchBar {
        let searchBar = UISearchBar(frame: CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width - 20, height: 40)))
        searchBar.searchBarStyle = .minimal
        searchBar.tintColor = .systemGray
        let image = UIImage.getImageWithColor(color: backgroundColor, size: CGSize(width: UIScreen.main.bounds.width - 20, height: 40), cornerRaduis: 20)
        searchBar.setSearchFieldBackgroundImage(image, for: .normal)
        searchBar.searchTextPositionAdjustment = UIOffset(horizontal: 8, vertical: 0)
        searchBar.placeholder = placeholder
        searchBar.searchTextField.clearButtonMode = .never
        
        return searchBar
    }
}
