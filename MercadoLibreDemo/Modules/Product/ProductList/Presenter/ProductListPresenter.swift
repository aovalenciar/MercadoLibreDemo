//
//  ProductListPresenter.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 10/12/21.
//  
//

import UIKit

class ProductListPresenter {
    
    //MARK: - Properties
    
    weak var view: ProductListPresenterToViewProtocol?
    var interactor: ProductListPresenterToInteractorProtocol?
    var router: ProductListPresenterToRouterProtocol?
}

//MARK: - ProductListViewToPresenterProtocol

extension ProductListPresenter: ProductListViewToPresenterProtocol {

    func didTap(product: Product) {
        guard let controller = view as? UIViewController else {return}
        router?.pushToProductDetailViewController(for: product, navigationController: controller.navigationController)
    }
    
    func didTapSearch(text: String) {
        view?.showLoader()
        interactor?.getProducts(query: text)
    }
    
    func didTapSearchCancel() {
        view?.clearResults()
    }
}

//MARK: - ProductListInteractorToPresenterProtocol

extension ProductListPresenter: ProductListInteractorToPresenterProtocol {
    func handleProductsResponse(_ response: ProductResponse) {
        view?.display(products: response.products)
        view?.hideLoader()
    }
    
    func didFailGettingProducts(error: ProductListError) {
        view?.showError(error)
        view?.hideLoader()
    }
}
