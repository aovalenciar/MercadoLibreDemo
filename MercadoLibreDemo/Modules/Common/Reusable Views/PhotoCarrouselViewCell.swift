//
//  PhotoCarrouselViewCell.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//

import UIKit
import SDWebImage

class PhotoCarrouselViewCell: UICollectionViewCell {

    //MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: - Properties
    
    public static var reuseId: String {
        return Self.className
    }
    
    public var url: URL? {
        didSet {
            imageView?.sd_setImage(with: url)
        }
    }
}
