//
//  ViewControllerMain.swift
//  HomeWork_08
//
//  Created by Борис Лустов on 29.06.22.
//

import UIKit

class ViewControllerMain: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction
    func showFiveStoryboard() {
        let fiveStoryboard = UIStoryboard(name: "FiveStoryboard", bundle: nil)
        let viewControllerFiveStrb = fiveStoryboard.instantiateViewController(withIdentifier: "FiveStoryboardID") as! ViewControllerFiveStrb
        
        present(viewControllerFiveStrb, animated: true)
    }
    
    @IBAction
    func showCustovClassStoryboard() {
        let customClassStrb = UIStoryboard(name: "CustomClass", bundle: nil)
        let viewControllerCstmClassStrb = customClassStrb.instantiateViewController(withIdentifier: "CustomClassID") as! ViewControllerCstmClass
        
        present(viewControllerCstmClassStrb, animated: true)
    }
    
}

