//
//  ProductListDelegateSource.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 10/12/21.
//

import UIKit

class ProductListDelegateSource: NSObject {
    
    //MARK: - Properties
    
    private weak var presenter: ProductListViewToPresenterProtocol?
    var products: [Product] = []
    
    //MARK: - Init
    
    init(presenter: ProductListViewToPresenterProtocol?) {
        self.presenter = presenter
    }
}

//MARK: - UITableViewDataSource

extension ProductListDelegateSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseId, for: indexPath) as! ProductCell
        let product = products[indexPath.row]
        cell.configure(product: product)
        return cell
    }
}

//MARK: - UITableViewDataSource

extension ProductListDelegateSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        presenter?.didTap(product: product)
    }
}
