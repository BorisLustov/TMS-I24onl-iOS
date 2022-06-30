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
    }
    
    @IBAction func goToGameMain(_ sender: Any) {
        let gameMainStoryboard = UIStoryboard(name: "Game", bundle: nil)
        let viewControllerGameMain = gameMainStoryboard.instantiateViewController(withIdentifier: "GameMainID") as! ViewControllerGameMain
        
        viewControllerGameMain.modalPresentationStyle = .fullScreen
        viewControllerGameMain.modalTransitionStyle = .crossDissolve
        
        present(viewControllerGameMain, animated: true)
    }
    
    @IBAction func goToScoresMain(_ sender: Any) {
        let scoresMainStoryboard = UIStoryboard(name: "Scores", bundle: nil)
        let viewControllerScoresMain = scoresMainStoryboard.instantiateViewController(withIdentifier: "ScoresMainID") as! ViewControllerScoresMain
        
        viewControllerScoresMain.modalPresentationStyle = .fullScreen
        viewControllerScoresMain.modalTransitionStyle = .crossDissolve
        
        present(viewControllerScoresMain, animated: true)
    }
    
    @IBAction func goToSettingsMain(_ sender: Any) {
        let settingsMainStoryboard = UIStoryboard(name: "Settings", bundle: nil)
        let viewControllerSettingsMain = settingsMainStoryboard.instantiateViewController(withIdentifier: "SettingsMainID") as! ViewControllerSettingsMain
        
        viewControllerSettingsMain.modalPresentationStyle = .fullScreen
        viewControllerSettingsMain.modalTransitionStyle = .crossDissolve
        
        present(viewControllerSettingsMain, animated: true)
    }
    
}

