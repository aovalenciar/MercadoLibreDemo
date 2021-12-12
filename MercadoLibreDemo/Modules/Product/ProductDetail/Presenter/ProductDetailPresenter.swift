//
//  ProductDetailPresenter.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//  
//

import UIKit

class ProductDetailPresenter  {
    
    required init(productId: String) {
        self.productId = productId
    }
    
    //MARK: - Properties
    
    weak var view: ProductDetailPresenterToViewProtocol?
    var interactor: ProductDetailPresenterToInteractorProtocol?
    var router: ProductDetailPresenterToRouterProtocol?
    var productId: String
    var productDetail: ProductDetail?
}

//MARK: - ProductDetailViewToPresenterProtocol

extension ProductDetailPresenter: ProductDetailViewToPresenterProtocol {
    
    func viewDidLoad() {
        requestProductDetail()
    }
    
    func requestProductDetail() {
        view?.showLoader()
        afterDelay(seconds: 0.2) { [weak self] in
            guard let self = self else {return}
            self.interactor?.getProductDetail(id: self.productId)
        }
    }
    
    func didTapPhoto(at index: Int) {
        guard let viewController = view as? UIViewController,
              let productDetail = productDetail else {return}
        router?.presentPhotoViewController(photos: productDetail.pictures, photoIndex: index, in: viewController)
    }
}

//MARK: - ProductDetailInteractorToPresenterProtocol

extension ProductDetailPresenter: ProductDetailInteractorToPresenterProtocol {
    func handleProductDetailResponse(_ response: ProductDetail) {
        productDetail = response
        view?.display(productDetail: response)
        view?.hideLoader()
    }
    
    func didFailGettingProductDetail(error: ProductDetailError) {
        view?.showError(error)
        view?.hideLoader()
    }
}
