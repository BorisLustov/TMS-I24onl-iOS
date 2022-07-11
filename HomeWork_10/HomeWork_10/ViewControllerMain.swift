//
//  ViewControllerMain.swift
//  HomeWork_10
//
//  Created by Борис Лустов on 9.07.22.
//

import UIKit

class ViewControllerMain: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .randomColor()
        title = "Main"
    }
    
    @IBAction
    func showSqaresVC() {
                
        let vc = ViewControllerSquares()
        navigationController?.pushViewController(vc, animated: true)
    }


}

