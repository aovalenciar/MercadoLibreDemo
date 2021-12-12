//
//  DefaultDZNEmptyDataSetDelegate.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//

import UIKit
import DZNEmptyDataSet

protocol DefaultDZNEmptyDataSetDelegate: DZNEmptyDataSetDelegate {
    func emptyDataSet(_ scrollView: UIScrollView!, didTapViewWithInternet view: UIView!)
}
