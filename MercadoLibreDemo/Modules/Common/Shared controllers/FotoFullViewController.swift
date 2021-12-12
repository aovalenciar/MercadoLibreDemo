//
//  FotoFullViewController.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 10/12/21.
//
//

import UIKit
import SDWebImage
import AVFoundation

protocol FotoFullViewControllerDelegate: class {
    func fotoFullViewControllerDidDismiss(in photo: URLTransformable, controller: FotoFullViewController)
}

class FotoFullViewController: ZoomableImageViewController {
    
    //MARK: - Init
    
    convenience init(pageIndex: Int, ureable: URLTransformable, tag: String) {
        self.init(nibName: nil, bundle: nil)
        self.pageIndex = pageIndex
        self.ureable = ureable
        self.tag = tag
    }
    
    //MARK: - Properties
    
    var pageIndex = 0
    private var ureable: URLTransformable?
    private lazy var laodingView = LoadingView(indicatorColor: .white, backgroundColor: .clear, interactionEnabled: true)
    private var tag = ""
    public weak var delegate: FotoFullViewControllerDelegate?
    
    //MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    //MARK: - SetupView
    
    private func setUpView() {
        configureNavigationBar()
        configureScrollView()
        laodingView.startAnimating(in: imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 44)
        loadImage()
        addSubViews()
        addGestures()
    }
    
    private func configureScrollView() {
        scrollView.frame = view.bounds
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 4.0
        scrollView.zoomScale = 1.0
        scrollView.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin, .flexibleTopMargin]
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.autoresizesSubviews = true
        scrollView.contentInsetAdjustmentBehavior = .never
        view.addSubview(scrollView)
    }
    
    private func configureNavigationBar() {
        let closeButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(dismissTapped))
        navigationItem.leftBarButtonItem = closeButton
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.hidesBarsOnTap = true
    }
    
    private func addSubViews() {
        scrollView.addSubview(imageView)
        view.sendSubviewToBack(scrollView)
    }
    
    private func addGestures() {
        let swipeGestRecog = UISwipeGestureRecognizer(target: self, action: #selector(dismissTapped))
        swipeGestRecog.direction = [.down, .up]
        view.addGestureRecognizer(swipeGestRecog)
    }
    
    private func loadImage() {
        guard let url = ureable?.urlValue else {return}
        
        imageView.sd_setImage(with: url) { [weak self ](image, _, _, _) -> Void in
            guard let image = image,
                  let self = self else { return }
            
            self.imageView.frame = AVMakeRect(aspectRatio: image.size, insideRect: self.imageView.frame)
            self.laodingView.stopAnimating()
        }
    }
    
    //MARK: - Actions
    
    @objc func dismissTapped() {
        
        if let ureable = ureable {
            delegate?.fotoFullViewControllerDidDismiss(in: ureable, controller: self)
        }
        
        dismiss(animated: true, completion: nil)
    }
}

