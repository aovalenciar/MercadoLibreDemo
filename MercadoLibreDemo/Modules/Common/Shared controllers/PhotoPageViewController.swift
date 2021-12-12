//
//  FotoFullPageViewController.swift
//  MercadoLibreDemo
//
//  Created by Alan Valencia on 10/12/21.
//
//

import UIKit

protocol PhotoPageViewControllerDelegate: class {
    func photoPageViewControllerDidDismiss(photo: URLTransformable, in controller: PhotoPageViewController)
}

class PhotoPageViewController: UIPageViewController {

    //MARK: - Variables
    
    public var ureables = [URLTransformable]()
    public  var actualIndex = 0
    public var tag = ""
    public weak var photoDelegate: PhotoPageViewControllerDelegate?
    
    //MARK: - View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK: - Setup view
    
    func setupView() {
        dataSource = self
        view.backgroundColor = .black
        let initialViewController = getController(at: actualIndex)!
        setViewControllers([initialViewController], direction: .forward, animated: false, completion: nil)
    }
    
    //MARK: - Util methods
    
    func getController(at index: Int) -> UINavigationController? {
    
        if index < 0 || index >= ureables.count {
            return nil
        }

        let fotoVC = FotoFullViewController(pageIndex: index, ureable: ureables[index], tag: tag)
        fotoVC.delegate = self
        
        return fotoVC.wrappedInNavVC
    }
    
    func getIndex(for viewController: UIViewController) -> Int {
        
        if let navVC = viewController as? UINavigationController,
            let fotoVC = navVC.topViewController as? FotoFullViewController {
            return fotoVC.pageIndex
        }
        
        return NSNotFound
    }
}

//MARK: - UIPageViewControllerDataSource

extension PhotoPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = getIndex(for: viewController)
        
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        
        return self.getController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = getIndex(for: viewController)
        
        if index == NSNotFound {
            return nil
        }
        
        index -= 1
        
        return getController(at: index)
    }
}

//MARK: - FotoFullViewControllerDelegate

extension PhotoPageViewController: FotoFullViewControllerDelegate {
    
    func fotoFullViewControllerDidDismiss(in photo: URLTransformable, controller: FotoFullViewController) {
        photoDelegate?.photoPageViewControllerDidDismiss(photo: photo, in: self)
    }
}
