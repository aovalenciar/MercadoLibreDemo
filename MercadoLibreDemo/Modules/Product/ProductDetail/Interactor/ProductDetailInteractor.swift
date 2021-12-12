//
//  ProductDetailInteractor.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//  
//

import Foundation

class ProductDetailInteractor: ProductDetailPresenterToInteractorProtocol {

    //MARK: - Properties
    
    weak var presenter: ProductDetailInteractorToPresenterProtocol?
    private let manager = ProductApiManager()

    //MARK: - Requests methods
    
    func getProductDetail(id: String) {
        manager.getProductDetail(id: id) { [weak self] (response) in
            self?.handleGetProductDetail(response: response)
        }
    }
    
    private func handleGetProductDetail(response: ApiResponse<ProductDetail>) {
        switch response {
        case .success(let productDetail):
            presenter?.handleProductDetailResponse(productDetail)
        case .error(let error):
            logger.error("\(error.localizedDescription)")
            presenter?.didFailGettingProductDetail(error: ProductDetailError(error: error))
        }
    }
}
