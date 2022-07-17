//
//  ViewControllerMain.swift
//  HomeWork_09
//
//  Created by Борис Лустов on 7.07.22.
//

import UIKit

class ViewControllerMain: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .randomColor()
        title = "Main"
        
    }
    
    @IBAction
    func showRandomCircles() {
        
        let viewControllerRandCircles = ViewControllerRandomCircles()
        navigationController?.pushViewController(viewControllerRandCircles, animated: true)
    }
    
    @IBAction
    func showSwypeCircle() {
        
        let viewControllerSwypeCircle = ViewControllerSwypeCircle()
        navigationController?.pushViewController(viewControllerSwypeCircle, animated: true)
    }
    
    @IBAction
    func showMoveCircle() {
       
        let viewControllerMoveCircle = ViewControllerMoveCircle()
        navigationController?.pushViewController(viewControllerMoveCircle, animated: true)
    }

}

