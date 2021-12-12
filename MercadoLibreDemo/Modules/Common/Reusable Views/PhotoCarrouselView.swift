//
//  PhotoCarrouselView.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 11/12/21.
//

import UIKit
import SDWebImage

protocol PhotoCarrouselViewDelegate: class {
    func photoCarrouselView(_ view: PhotoCarrouselView, didTap photo: URLTransformable, at index: Int)
}

class PhotoCarrouselView: UIView, NibGettable {

    //MARK: - Outlets
    
    @IBOutlet weak private var collectionView: UICollectionView!
    @IBOutlet weak private var pageLabel: UILabel!
    @IBOutlet weak private var pageLabelView: UIView!
    
    //MARK: - Properties
    
    public var items: [URLTransformable] = [] {
        didSet {
            pageLabelView.isHidden = (items.count == 0)
            collectionView.reloadData()
            assignCurrentPage()
        }
    }
    
    public weak var delegate: PhotoCarrouselViewDelegate?
    
    private var currentPage: Int {
        guard collectionView.frame.size.width > 0 else {return 0}
        return  Int(collectionView.contentOffset.x / collectionView.frame.size.width) + 1
    }
    
    //MARK: - NibGettable
    
    static var nibName: String {
        return Self.className
    }
    
    //MARK: - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UINib(nibName: PhotoCarrouselViewCell.reuseId, bundle: nil), forCellWithReuseIdentifier: PhotoCarrouselViewCell.reuseId)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func assignCurrentPage() {
        pageLabel.text = "\(currentPage)/\(items.count)"
    }
}

//MARK: - UICollectionViewDataSource

extension PhotoCarrouselView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCarrouselViewCell.reuseId, for: indexPath) as! PhotoCarrouselViewCell
        let item = items[indexPath.row]
        cell.url = item.urlValue
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension PhotoCarrouselView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        assignCurrentPage()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        delegate?.photoCarrouselView(self, didTap: item, at: indexPath.row)
    }
}
