//
//  RoundedView.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//

import UIKit

class RoundedView: UIView {
 
    //MARK: - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureProperties()
    }
    
    convenience init(rect: CGRect) {
        self.init(frame: rect)
        configureProperties()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configureProperties()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureProperties()
    }
    
    //MARK: - Util methods
    
    func configureProperties() {
        let min = fmin(self.frame.width, self.frame.height)
        self.layer.cornerRadius = min/2
        self.clipsToBounds = true
    }
}
