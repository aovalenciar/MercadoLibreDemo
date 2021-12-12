//
//  ProductListContract.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 10/12/21.
//  
//

import UIKit

protocol ProductListViewToPresenterProtocol: class {
    var view: ProductListPresenterToViewProtocol? { get set }
    var interactor: ProductListPresenterToInteractorProtocol? { get set }
    var router: ProductListPresenterToRouterProtocol? { get set }
    func didTap(product: Product)
    func didTapSearch(text: String)
    func didTapSearchCancel()
}

protocol ProductListPresenterToViewProtocol: class {
    func display(products: [Product])
    func showLoader()
    func hideLoader()
    func clearResults()
    func showError(_ error: ProductListError)
}

protocol ProductListPresenterToRouterProtocol: class {
    static func createProductListViewController() -> ProductListViewController
    func pushToProductDetailViewController(for product: Product, navigationController: UINavigationController?)
}

protocol ProductListInteractorToPresenterProtocol: class {
    func handleProductsResponse(_ response: ProductResponse)
    func didFailGettingProducts(error: ProductListError)
}

protocol ProductListPresenterToInteractorProtocol: class {
    var presenter: ProductListInteractorToPresenterProtocol? { get set }
    func getProducts(query: String)
}
