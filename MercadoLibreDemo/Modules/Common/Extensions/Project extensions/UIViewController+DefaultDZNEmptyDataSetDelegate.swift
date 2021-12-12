//
//  UIView+DefaultDZNEmptyDataSetDelegate.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 10/12/21.
//

import UIKit
import DZNEmptyDataSet

extension UIViewController: DefaultDZNEmptyDataSetDelegate {
    
    //MARK: - DefaultDZNEmptyDataSetSource
    
    @objc func emptyDataSet(_ scrollView: UIScrollView!, didTapViewWithInternet view: UIView!) {}
    
    //MARK: - DZNEmptyDataSetDelegate
    
    public func emptyDataSetShouldAnimateImageView(_ scrollView: UIScrollView) -> Bool {
        return emptyViewIsLoading
    }
    
    @objc public func emptyDataSet(_ scrollView: UIScrollView, didTap view: UIView) {}
    
    public func imageTintColor(forEmptyDataSet scrollView: UIScrollView) -> UIColor? {
        return nil
    }
    
    public func backgroundColor(forEmptyDataSet scrollView: UIScrollView) -> UIColor? {
        return UIColor.white
    }
}
