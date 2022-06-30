//
//  ViewControllerSettingsMain.swift
//  Racing2D
//
//  Created by Борис Лустов on 30.06.22.
//

import UIKit

class ViewControllerSettingsMain: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
    }

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
