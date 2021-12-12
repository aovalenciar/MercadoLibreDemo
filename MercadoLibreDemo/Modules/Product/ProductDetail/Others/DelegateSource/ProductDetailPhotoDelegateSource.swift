//
//  ProductDetailPhotoDelegateSource.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//

import UIKit

class ProductDetailPhotoDelegateSource: NSObject {
    
    //MARK: - Properties
    
    private weak var presenter: ProductDetailViewToPresenterProtocol?

    //MARK: - Init
    
    init(presenter: ProductDetailViewToPresenterProtocol?) {
        self.presenter = presenter
    }
}

//MARK: - PhotoCarrouselViewDelegate

extension ProductDetailPhotoDelegateSource: PhotoCarrouselViewDelegate {
    func photoCarrouselView(_ view: PhotoCarrouselView, didTap photo: URLTransformable, at index: Int) {
        presenter?.didTapPhoto(at: index)
    }
}
