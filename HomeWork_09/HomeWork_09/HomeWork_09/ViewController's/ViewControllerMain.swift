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
        
        navigationController?.navigationBar.topItem?.title = "Main"
        
    }
    
    // Buttons
    
    @IBAction
    func showRandomCircles() {
        let randomCirclesStrbrd = UIStoryboard(name: "RandomCircles", bundle: nil)
        let viewControllerRandCircles = randomCirclesStrbrd.instantiateViewController(withIdentifier: "RandomCirclesID") as! ViewControllerRandomCircles
        
        navigationController?.pushViewController(viewControllerRandCircles, animated: true)
    }
    
    @IBAction
    func showSwypeCircle() {
        let swypeCircleStrbrd = UIStoryboard(name: "SwypeCircle", bundle: nil)
        let viewControllerSwypeCircle = swypeCircleStrbrd.instantiateViewController(withIdentifier: "SwypeCircleID") as! ViewControllerSwypeCircle
        
        navigationController?.pushViewController(viewControllerSwypeCircle, animated: true)
    }
    
    @IBAction
    func showMoveCircle() {
        let moveCircleStrbrd = UIStoryboard(name: "MoveCircle", bundle: nil)
        let viewControllerMoveCircle = moveCircleStrbrd.instantiateViewController(withIdentifier: "MoveCircleID") as! ViewControllerMoveCircle
        
        navigationController?.pushViewController(viewControllerMoveCircle, animated: true)
    }

}

