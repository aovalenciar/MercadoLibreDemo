//
//  ProductDetailContract.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//  
//

import UIKit

protocol ProductDetailViewToPresenterProtocol: class {
    var view: ProductDetailPresenterToViewProtocol? { get set }
    var interactor: ProductDetailPresenterToInteractorProtocol? { get set }
    var router: ProductDetailPresenterToRouterProtocol? { get set }
    func viewDidLoad()
    func didTapPhoto(at index: Int)
    func requestProductDetail()
}

protocol ProductDetailPresenterToViewProtocol: class {
    func display(productDetail: ProductDetail)
    func showLoader()
    func hideLoader()
    func showError(_ error: ProductDetailError)
}

protocol ProductDetailPresenterToRouterProtocol: class {
    static func createProductDetailViewController(productId: String) -> ProductDetailViewController
    func presentPhotoViewController(photos: [URLTransformable], photoIndex: Int, in viewController: UIViewController)
}

protocol ProductDetailInteractorToPresenterProtocol: class {
    func handleProductDetailResponse(_ response: ProductDetail)
    func didFailGettingProductDetail(error: ProductDetailError)
}

protocol ProductDetailPresenterToInteractorProtocol: class {
    var presenter: ProductDetailInteractorToPresenterProtocol? { get set }
    func getProductDetail(id: String)
}
