//
//  ViewControllerFiveStrb.swift
//  HomeWork_08
//
//  Created by Борис Лустов on 30.06.22.
//

import UIKit

class ViewControllerFiveStrb: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
    }
    
    @IBAction func toSecondScreen() {
        let fiveStoryboard = UIStoryboard(name: "FiveStoryboard", bundle: nil)
        let secondScreenViewController = fiveStoryboard.instantiateViewController(withIdentifier: "FiveStrbSecondScreenID") as! ViewControllerFiveStrb2
        
        secondScreenViewController.set1(text1: "Hello there!")
        
        navigationController?.pushViewController(secondScreenViewController, animated: true)
    }
}
