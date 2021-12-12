//
//  EmptyMessageView.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 10/12/21.
//

import UIKit
import DZNEmptyDataSet

class EmptyMessageView: UIView {

    //MARK: - Variables
    
    weak var delegate: DZNEmptyDataSetDelegate? {
        didSet {
            tableView.emptyDataSetDelegate = delegate
        }
    }
    weak var dataSource: DZNEmptyDataSetSource? {
        didSet {
            tableView.emptyDataSetSource = dataSource
        }
    }
    lazy var emptyDataSetTag: Int  = {
        return Int(Date().timeIntervalSinceReferenceDate)
    }()
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.tag = self.emptyDataSetTag
        return tableView
    }()
    fileprivate let reuseId = "EmptyMessageViewCell"
    
    //MARK: - Util methods
    
    fileprivate func configureView(parentView: UIView) {
        parentView.addSubview(self)
        
        self.frame = parentView.bounds
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        backgroundColor = .white
        
        addSubview(tableView)
  
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = backgroundColor
        tableView.dataSource = self
    }
    
    fileprivate static func removeOldView(from view: UIView) {
        if let oldView = view.subviews.filter({$0 is EmptyMessageView}).first {
            oldView.removeFromSuperview()
        }
    }
    
    func reloadEmptyDataSet() {
        tableView.reloadEmptyDataSet()
    }
    
    //MARK: - Static methods
    
    static func remove(view: EmptyMessageView?) {
        var view = view
        if view != nil {
            view!.removeFromSuperview()
            view = nil
        }
    }
    
    static func add<D:DZNEmptyDataSetSource & DZNEmptyDataSetDelegate>(view: EmptyMessageView?, parentView: UIView, sourceDelegate: D) {
        
        guard let view = view else {return}
        
        removeOldView(from: parentView)
        
        if !view.isDescendant(of: parentView) {
            
            view.configureView(parentView: parentView)
            
            view.dataSource = sourceDelegate
            view.delegate = sourceDelegate
        }
    }

}

//MARK: - UITableViewDataSource

extension EmptyMessageView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        
        cell = tableView.dequeueReusableCell(withIdentifier: reuseId)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: reuseId)
        }
        
        return cell!
    }
}
