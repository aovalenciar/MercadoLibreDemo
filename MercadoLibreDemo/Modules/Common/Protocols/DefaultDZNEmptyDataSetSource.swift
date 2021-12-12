//
//  DefaultDZNEmptyDataSetSource.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//

import UIKit
import DZNEmptyDataSet

protocol DefaultDZNEmptyDataSetSource: DZNEmptyDataSetSource {
    
    var emptyImage: UIImage? {get}
    var errorImage: UIImage? {get}
    
    var emptyViewIsLoading: Bool {get set}
    var requestError: Error? {get set}
    
    var errorTitle: String {get}
    var emptyTitle: String {get}
    
    var errorMessage: String {get}
    var emptyMessage: String {get}
}

extension DefaultDZNEmptyDataSetSource {
    
    //MARK: - DefaultDZNEmptyDataSetSource
    
    var errorImage: UIImage? {
        return UIImage(named: "wifi")
    }
    
    var emptyImage: UIImage? {
        return nil
    }
    
    var errorTitle: String {
        return ""
    }
    
    var emptyTitle: String {
        return ""
    }
    
    var errorMessage: String {
        return ""
    }
    
    var emptyMessage: String {
        return ""
    }
    
    var emptyViewIsLoading: Bool {
        get {return false}
        set {}
    }
    
    var requestError: Error? {
        get {return nil}
        set {}
    }
}
