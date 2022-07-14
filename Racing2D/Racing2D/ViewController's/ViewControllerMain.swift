//
//  ViewControllerMain.swift
//  Racing2D
//
//  Created by Борис Лустов on 30.06.22.
//

import UIKit

class ViewControllerMain: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        title = "Menu"
    }
    
    @IBAction func goToGameMain(_ sender: Any) {
        
        let gameVC = ViewControllerGameMain()
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    @IBAction func goToScoresMain(_ sender: Any) {
        
        let scoresVC = ViewControllerScoresMain()
        navigationController?.pushViewController(scoresVC, animated: true)
    }
    
    @IBAction func goToSettingsMain(_ sender: Any) {
        
        let settingsVC = ViewControllerSettingsMain()
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    
}

