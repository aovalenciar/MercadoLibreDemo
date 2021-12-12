//
//  ProductListInteractor.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 10/12/21.
//  
//

import Foundation

class ProductListInteractor: ProductListPresenterToInteractorProtocol {
    
    //MARK: - Properties
    
    weak var presenter: ProductListInteractorToPresenterProtocol?
    private let manager = ProductApiManager()
    
    //MARK: - Requests methods
    
    func getProducts(query: String) {
        manager.getProducts(searchQuery: query) { [weak self] (response) in
            self?.handleGetProducts(response: response)
        }
    }
    
    private func handleGetProducts(response: ApiResponse<ProductResponse>) {
        switch response {
        case .success(let productResponse):
            if productResponse.products.count > 0 {
                presenter?.handleProductsResponse(productResponse)
            } else {
                presenter?.didFailGettingProducts(error: ProductListError.withoutResults)
            }
        case .error(let error):
            logger.error("\(error.localizedDescription)")
            presenter?.didFailGettingProducts(error: ProductListError(error: error))
        }
    }
}
