//
//  SearchBarDelegateSource.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//

import UIKit

class SearchBarDelegateSource: NSObject {
    
    //MARK: - Properties
    
    private weak var presenter: ProductListViewToPresenterProtocol?
    var products: [Product] = []
    
    //MARK: - Init
    
    init(presenter: ProductListViewToPresenterProtocol?) {
        self.presenter = presenter
    }
}

//MARK: - UISearchBarDelegate

extension SearchBarDelegateSource: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        searchBar.text = ""
        presenter?.didTapSearchCancel()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard !searchBar.text!.isEmpty else {return}
        
        searchBar.endEditing(true)
        presenter?.didTapSearch(text: searchBar.text!)
    }
}
