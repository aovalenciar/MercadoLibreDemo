//
//  ProductDetailViewController.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//  
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak private var carrouselContainerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var acceptsMercadoPagoLabel: UILabel!

    //MARK: - Properties
    
    var presenter: ProductDetailViewToPresenterProtocol?
    private let loadingView = LoadingView(indicatorColor: .navBarColor, backgroundColor: .white, interactionEnabled: false)
    private lazy var photoDelegateHandler = ProductDetailPhotoDelegateSource(presenter: self.presenter)
    private lazy var carrouselView: PhotoCarrouselView = {
        let view = PhotoCarrouselView.getNibView() as! PhotoCarrouselView
        view.delegate = photoDelegateHandler
        return view
    }()

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubViews()
        presenter?.viewDidLoad()
    }
    
    //MARK: - Util methods
    
    private func setupView() {
        extendedLayoutIncludesOpaqueBars = true
    }
    
    private func addSubViews() {
        carrouselContainerView.addSubviewWithConstraints(subView: carrouselView)
    }
}

//MARK: - ProductDetailPresenterToViewProtocol

extension ProductDetailViewController: ProductDetailPresenterToViewProtocol {
    func display(productDetail: ProductDetail) {
        carrouselView.items = productDetail.pictures
        titleLabel.text = productDetail.title
        priceLabel.text = productDetail.formattedPrice
        acceptsMercadoPagoLabel.isHidden = !productDetail.acceptsMercadopago
        removeEmptyMessageView()
    }
    
    func showLoader() {
        loadingView.startAnimating(in: view)
    }
    
    func hideLoader() {
        loadingView.stopAnimating()
    }
    
    func showError(_ error: ProductDetailError) {
        addEmptyMessageView(in: view, delegate: self, error: error)
    }
}

//MARK: - DZNEmptyDataSetDelegate

extension ProductDetailViewController {
    override func emptyDataSet(_ scrollView: UIScrollView, didTap view: UIView) {
        presenter?.requestProductDetail()
    }
}
