//
//  ZoomableImageViewController.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 10/12/21.
//
//

import UIKit

class ZoomableImageViewController: UIViewController {
    
    //MARK: - Variables
    
    fileprivate var _scrollView: UIScrollView!
    fileprivate var _imageView: UIImageView!
    
    var scrollView: UIScrollView {
        if _scrollView == nil {
            _scrollView = UIScrollView()
            _scrollView.delegate = self
        }
        return _scrollView
    }
    
    var imageView: UIImageView {
        if _imageView == nil {
            _imageView = UIImageView()
        }
        return _imageView
    }
    
    //MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(_:)))
        doubleTapRecognizer.numberOfTapsRequired = 2
        doubleTapRecognizer.numberOfTouchesRequired = 1
        scrollView.addGestureRecognizer(doubleTapRecognizer)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        centerScrollViewContent()
    }
    
    //MARK: - Util methods
    
    @objc func handleDoubleTap(_ recognizer: UITapGestureRecognizer!) {
        let pointInView = recognizer.location(in: self.imageView)
        self.zoomInZoomOut(pointInView)
    }
    
    func zoomInZoomOut(_ point: CGPoint!) {
        let newZoomScale = self.scrollView.zoomScale > (self.scrollView.maximumZoomScale/2) ? self.scrollView.minimumZoomScale: self.scrollView.maximumZoomScale
        
        let scrollViewSize = self.scrollView.bounds.size
        
        let width = scrollViewSize.width / newZoomScale
        let height = scrollViewSize.height / newZoomScale
        let x = point.x - (width / 2.0)
        let y = point.y - (height / 2.0)
        
        let rectToZoom = CGRect(x: x, y: y, width: width, height: height)
        
        self.scrollView.zoom(to: rectToZoom, animated: true)
    }
    
    func centerScrollViewContent() {
        let boundsSize = scrollView.frame
        var contentsFrame = imageView.frame
        
        if contentsFrame.size.width < boundsSize.width {
            contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0
        } else {
            contentsFrame.origin.x = 0.0
        }
        
        if contentsFrame.size.height < boundsSize.height {
            contentsFrame.origin.y = (boundsSize.height - scrollView.verticalScrollIndicatorInsets.top - scrollView.verticalScrollIndicatorInsets.bottom - contentsFrame.size.height) / 2.0
        } else {
            contentsFrame.origin.y = 0.0
        }
        
        self.imageView.frame = contentsFrame
    }
    
}

//MARK: - UIScrollViewDelegate

extension ZoomableImageViewController: UIScrollViewDelegate {
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerScrollViewContent()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
}

