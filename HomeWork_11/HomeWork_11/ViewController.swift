//
//  ViewController.swift
//  HomeWork_11
//
//  Created by Борис Лустов on 12.07.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .randomColor()
        
        navigationController?.navigationBar.topItem?.title = "Main"
    }
    
    @IBAction
    func showInfinityCircle() {
        
        let infCircleVC = ViewControllerInfCircle()
        navigationController?.pushViewController(infCircleVC, animated: true)
    }
    
    @IBAction
    func showGallery() {
        
        let galleryVC = ViewControllerGallery()
        navigationController?.pushViewController(galleryVC, animated: true)
    }
}

