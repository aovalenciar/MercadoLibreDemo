//
//  UIView+DefaultDZNEmptyDataSetSource.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 10/12/21.
//

import UIKit
import DZNEmptyDataSet

extension UIViewController: DefaultDZNEmptyDataSetSource {
    
    struct AssociatedKey {
        static var Loading = "Loading"
        static var RequestError = "RequestError"
    }
    
    //MARK: - DefaultDZNEmptyDataSetSource
    
    @objc var errorImage: UIImage? {
        
        if let errorDescriptable = requestError as? ErrorDescriptable {
            if let imageName = errorDescriptable.imageName {
                return UIImage(named: imageName)
            }
            
            return nil
        }
        
        return UIImage(named: "wifi")
    }
    
    @objc var emptyImage: UIImage? {
        return nil
    }
    
    @objc var errorTitle: String {
        
        if let errorDescriptable = requestError as? ErrorDescriptable {
            return errorDescriptable.title
        }
        
        return Texts.General.oops
    }
    
    @objc var errorMessage: String {
        
        if let errorDescriptable = requestError as? ErrorDescriptable {
            return errorDescriptable.message
        }
        
        return Texts.General.generalErrorMessage
    }
    
    @objc var emptyTitle: String {
        return ""
    }
    
    @objc var emptyMessage: String {
        return ""
    }
    
    var emptyViewIsLoading: Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.Loading) as? Bool ?? loadingDefaultValue
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.Loading, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var loadingDefaultValue: Bool {
        return false
    }
    
    var requestError: Error? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.RequestError) as? NSError
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKey.RequestError, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    //MARK: - DZNEmptyDataSetSource
    
    public func image(forEmptyDataSet scrollView: UIScrollView) -> UIImage? {
        
        if emptyViewIsLoading {
            return UIImage(named: "loading")
        } else {
            return (requestError == nil) ? emptyImage : errorImage
        }
    }
    
    public func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let text = (requestError != nil) ? errorTitle : emptyTitle
        return EmptyDataSetHelper.getAttributedTitle(font: .systemFont(ofSize: 17, weight: .semibold), color: .darkGray, text: text)
    }
    
    public func description(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let text = (requestError != nil) ? errorMessage : emptyMessage
        return EmptyDataSetHelper.getAttributedDescription(font: .systemFont(ofSize: 15, weight: .light), color: .darkGray, text: text)
    }
    
    public func verticalOffset(forEmptyDataSet scrollView: UIScrollView) -> CGFloat {
        return EmptyDataSetHelper.centerVerticalOffset
    }
    
    public func spaceHeight(forEmptyDataSet scrollView: UIScrollView) -> CGFloat {
        return EmptyDataSetHelper.centerSpaceHeight
    }
    
    public func imageAnimation(forEmptyDataSet scrollView: UIScrollView) -> CAAnimation? {
        return EmptyDataSetHelper.imageAnimation
    }
    
}
