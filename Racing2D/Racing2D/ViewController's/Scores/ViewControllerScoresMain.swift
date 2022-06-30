//
//  ViewControllerScoresMain.swift
//  Racing2D
//
//  Created by Борис Лустов on 30.06.22.
//

import UIKit

class ViewControllerScoresMain: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
    }

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
