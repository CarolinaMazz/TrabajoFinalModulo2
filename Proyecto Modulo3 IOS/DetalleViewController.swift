//
//  DetalleViewController.swift
//  Proyecto Modulo3 IOS
//
//  Created by Carolina Mazzaglia on 17/03/17.
//  Copyright © 2017 Carolina Mazzaglia. All rights reserved.
//

import UIKit


class DetalleViewController:UIViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource{
    
    var paginas = Array<String>()
    var pageViewController: UIPageViewController?
    var parametro:item!
    
    @IBOutlet weak var lbTitulo: UILabel!
    @IBOutlet weak var txtViewDetalle: UITextView!
    @IBOutlet weak var lbPrecio: UILabel!
    
    //@IBOutlet weak var scrContenedor: UIScrollView!
    @IBOutlet weak var contenedor: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lbTitulo.text = parametro.nombre
        lbPrecio.text = "S/. \(parametro.precio!)"
        txtViewDetalle.text = parametro.detalle
        
        //scrContenedor.addSubview(txtViewDetalle)
        
        //scrContenedor.contentSize = txtViewDetalle.frame.size
        
        for i in 1...10 {
            paginas.append("carro\(i)")
        }
        
        self.pageViewController = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        self.pageViewController!.delegate = self
        
        let startingViewController: ImagenesViewController = self.viewControllerAtIndex(0, storyboard: self.storyboard!)!
        let viewControllers = [startingViewController]
        self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: false, completion: {done in })
        
        self.pageViewController!.dataSource = self
        
        self.addChildViewController(self.pageViewController!)
        self.contenedor.addSubview(self.pageViewController!.view)
        
        // Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
        var pageViewRect = self.contenedor.bounds
        if UIDevice.current.userInterfaceIdiom == .pad {
            pageViewRect = pageViewRect.insetBy(dx: 40.0, dy: 40.0)
        }
        self.pageViewController!.view.frame = pageViewRect
        
        self.pageViewController!.didMove(toParentViewController: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
        if (orientation == .portrait) || (orientation == .portraitUpsideDown) || (UIDevice.current.userInterfaceIdiom == .phone) {
            let currentViewController = self.pageViewController!.viewControllers![0]
            let viewControllers = [currentViewController]
            self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: true, completion: {done in })
            
            self.pageViewController!.isDoubleSided = false
            return .min
        }

        let currentViewController = self.pageViewController!.viewControllers![0] as! ImagenesViewController
        var viewControllers: [UIViewController]
        
        let indexOfCurrentViewController = self.indexOfViewController(currentViewController)
        if (indexOfCurrentViewController == 0) || (indexOfCurrentViewController % 2 == 0) {
            let nextViewController = self.pageViewController(self.pageViewController!, viewControllerAfter: currentViewController)
            viewControllers = [currentViewController, nextViewController!]
        } else {
            let previousViewController = self.pageViewController(self.pageViewController!, viewControllerBefore: currentViewController)
            viewControllers = [previousViewController!, currentViewController]
        }
        self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: true, completion: {done in })
        
        return .mid
    }
    
    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> ImagenesViewController? {
        // Return the data view controller for the given index.
        if (self.paginas.count == 0) || (index >= self.paginas.count) {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        let dataViewController = storyboard.instantiateViewController(withIdentifier: "ImagenesViewController") as! ImagenesViewController
        dataViewController.dataObject = self.paginas[index]
        return dataViewController
    }
    
    func indexOfViewController(_ viewController: ImagenesViewController) -> Int {
        // Return the index of the given data view controller.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
        return paginas.index(of: viewController.dataObject) ?? NSNotFound
    }
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! ImagenesViewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! ImagenesViewController)
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.paginas.count {
            return nil
        }
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    
    @IBAction func btnComprar(_ sender: UIButton) {
        
        let listdatos = compra()
        
        listdatos.nombre = parametro.nombre
        listdatos.detalle = parametro.detalle
        listdatos.precio = parametro.precio
        listdatos.imagen = parametro.imagen
        compras.append(listdatos)
        print(compras)
        
    }
}
