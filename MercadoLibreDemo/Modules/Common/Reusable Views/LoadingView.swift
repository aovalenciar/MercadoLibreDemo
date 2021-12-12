//
//  LoadingView.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//

import UIKit

class LoadingView {
    
    //MARK: - Init
    
    init(indicatorColor: UIColor? = nil, backgroundColor: UIColor? = nil, interactionEnabled: Bool) {
        
        if let backgroundColor = backgroundColor {
            self.backgroundColor = backgroundColor
        }
        
        if let indicatorColor = indicatorColor {
            self.colorIndicatorView = indicatorColor
        }
        
        self.userInteractionEnabled = interactionEnabled
    }
    
    init() {
        
    }
    
    //MARK: - Variables
    
    var containerView: UIView!
    var backgroundColor = UIColor.clear
    var colorIndicatorView = UIColor.darkGray
    var userInteractionEnabled = false
    var indicatorStyle = UIActivityIndicatorView.Style.large
    
    //MARK: - Funciones de utilidad
    
    func startAnimating(in view: UIView) {
        
        //si ya tenía una vista animando
        //entonces no hacemos nada
        if self.containerView != nil {
            return
        }
        
        //armamos la vista de fondo
        self.containerView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height - abs(view.bounds.origin.y)))
        self.containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.containerView.backgroundColor = backgroundColor
        self.containerView.isUserInteractionEnabled = !userInteractionEnabled
        
        //armamos el ActivityView
        let activityView = UIActivityIndicatorView(style: indicatorStyle)
        activityView.color = colorIndicatorView
        activityView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let centerX = activityView.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor)
        let centerY = activityView.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor)
        activityView.startAnimating()
        
        //agregamos el ActivityView a la vista
        self.containerView.addSubview(activityView)
        NSLayoutConstraint.activate([centerX, centerY])
        
        if let scroll = view as? UIScrollView,
            userInteractionEnabled == false {
            scroll.isScrollEnabled = false
        }
        
        //agregamos la vista base a la vista que nos pasaron
        view.addSubview(self.containerView)
    }
    
    func stopAnimating() {

        if containerView != nil {
            
            if let scroll = containerView.superview as? UIScrollView {
                scroll.isScrollEnabled = true
            }
            
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
    deinit {
        stopAnimating()
    }
}
