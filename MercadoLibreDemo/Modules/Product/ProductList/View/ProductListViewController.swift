//
//  ProductListViewController.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 10/12/21.
//  
//

import UIKit

class ProductListViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!

    //MARK: - Properties
    
    var presenter: ProductListViewToPresenterProtocol?
    private lazy var dataSourceHandler = ProductListDelegateSource(presenter: self.presenter)
    private lazy var searchBarDelegateHandler = SearchBarDelegateSource(presenter: self.presenter)
    private let loadingView = LoadingView(indicatorColor: .navBarColor, backgroundColor: .white, interactionEnabled: false)
    private lazy var searchBar = UISearchBar.getRounded(placeholder: Texts.ProductList.searchBarPlaceHolder)

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        assignDelegates()
    }
    
    //MARK: - Util methods
    
    private func setupView() {
        navigationItem.removeBackButtonTitle()
        tableView.register(UINib(nibName: ProductCell.reuseId, bundle: nil), forCellReuseIdentifier: ProductCell.reuseId)
        tableView.removeExtraSeparators()
        tableView.keyboardDismissMode = .onDrag
        navigationItem.titleView = searchBar
    }
    
    private func assignDelegates() {
        tableView.dataSource = dataSourceHandler
        tableView.delegate = dataSourceHandler
        searchBar.delegate = searchBarDelegateHandler
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
    }
}

//MARK: - ProductListPresenterToViewProtocol

extension ProductListViewController: ProductListPresenterToViewProtocol {
    func display(products: [Product]) {
        requestError = nil
        dataSourceHandler.products = products
        tableView.reloadData()
    }
    
    func showLoader() {
        loadingView.startAnimating(in: view)
    }
    
    func hideLoader() {
        loadingView.stopAnimating()
    }
    
    func clearResults() {
        dataSourceHandler.products = []
        requestError = nil
        tableView.reloadData()
    }
    
    func showError(_ error: ProductListError) {
        requestError = error
        dataSourceHandler.products = []
        tableView.reloadData()
        tableView.reloadEmptyDataSet()
    }
}
