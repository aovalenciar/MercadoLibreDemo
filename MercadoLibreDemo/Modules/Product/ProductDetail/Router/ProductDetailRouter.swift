//
//  ProductDetailRouter.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//  
//

import Foundation
import UIKit

class ProductDetailRouter: ProductDetailPresenterToRouterProtocol {
 
    class func createProductDetailViewController(productId: String) -> ProductDetailViewController {
        let viewController: ProductDetailViewController = ProductDetailViewController()
        let presenter: ProductDetailViewToPresenterProtocol & ProductDetailInteractorToPresenterProtocol = ProductDetailPresenter(productId: productId)
        let interactor: ProductDetailPresenterToInteractorProtocol = ProductDetailInteractor()
        let router: ProductDetailPresenterToRouterProtocol = ProductDetailRouter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return viewController
    }
    
    func presentPhotoViewController(photos: [URLTransformable], photoIndex: Int, in viewController: UIViewController) {
        viewController.presentPhotoPageViewController(urleables: photos, initialIndex: photoIndex)
    }
}
