//
//  UIViewController+Extensions.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 10/12/21.
//
//

import UIKit
import DZNEmptyDataSet

extension UIViewController {
    
    private struct AssociatedMessageKey {
        static var ErrorMessageView = "ErrorMessageView"
    }
    
    var errorMessageView: EmptyMessageView? {
        get {
            return objc_getAssociatedObject(self, &AssociatedMessageKey.ErrorMessageView) as? EmptyMessageView
        }
        set {
            objc_setAssociatedObject(self, &AssociatedMessageKey.ErrorMessageView, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var wrappedInNavVC: UINavigationController {
        return CustomNavigationController(rootViewController: self)
    }
    
    func presentPhotoPageViewController(urleables: [URLTransformable], initialIndex: Int = 0) {
        let fotoFullPageVC = PhotoPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        fotoFullPageVC.ureables = urleables
        fotoFullPageVC.actualIndex = initialIndex
        
        present(fotoFullPageVC, animated: true, completion: nil)
    }
    
    func addEmptyMessageView<D:DZNEmptyDataSetSource & DZNEmptyDataSetDelegate>(in view: UIView, delegate: D, error: Error? = nil, backgroundColor: UIColor = .white) {
        requestError = error
        errorMessageView = EmptyMessageView()
        errorMessageView?.backgroundColor = backgroundColor
        EmptyMessageView.add(view: errorMessageView, parentView: view, sourceDelegate: delegate)
    }
    
    func removeEmptyMessageView() {
        requestError = nil
        EmptyMessageView.remove(view: errorMessageView)
    }
}
