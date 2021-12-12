//
//  ProductListRouter.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 10/12/21.
//  
//

import UIKit

class ProductListRouter: ProductListPresenterToRouterProtocol {
    
    class func createProductListViewController() -> ProductListViewController {
        let viewController: ProductListViewController = ProductListViewController()
        let presenter: ProductListViewToPresenterProtocol & ProductListInteractorToPresenterProtocol = ProductListPresenter()
        let interactor: ProductListPresenterToInteractorProtocol = ProductListInteractor()
        let router: ProductListPresenterToRouterProtocol = ProductListRouter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return viewController
    }
    
    func pushToProductDetailViewController(for product: Product, navigationController: UINavigationController?) {
        let productDetailVC = ProductDetailRouter.createProductDetailViewController(productId: product.id)
        navigationController?.pushViewController(productDetailVC, animated: true)
    }
}
