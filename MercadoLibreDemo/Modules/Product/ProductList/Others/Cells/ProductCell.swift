//
//  ProductCell.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 10/12/21.
//

import UIKit
import SDWebImage

class ProductCell: UITableViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var acceptsMercadoPagoLabel: UILabel!
    
    //MARK: - Properties
    
    static var reuseId: String {
        return Self.className
    }
    
    //MARK: - Util methods
    
    public func configure(product: Product) {
        productImageView.sd_setImage(with: product.thumbnail)
        titleLabel.text = product.title
        priceLabel.text = product.formattedPrice
        acceptsMercadoPagoLabel.isHidden = !product.acceptsMercadopago
    }
}
