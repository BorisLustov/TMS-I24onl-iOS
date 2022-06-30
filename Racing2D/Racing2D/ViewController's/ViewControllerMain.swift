//
//  ViewControllerMain.swift
//  Racing2D
//
//  Created by Борис Лустов on 30.06.22.
//

import UIKit

enum WhichViewController {
    case gameMain
    case scoresMain
    case settingsMain
}

class ViewControllerMain: UIViewController {
    
    /// Switching to the storyboard by parameters
    func goToStoryboard(uIStrb: String, viewCntrlID: String, uIViewCntrl: WhichViewController) {
        let storyboard = UIStoryboard(name: uIStrb, bundle: nil)
        var viewController = UIViewController()
        switch uIViewCntrl {
        case .gameMain:
             viewController = storyboard.instantiateViewController(withIdentifier: viewCntrlID) as! ViewControllerGameMain
        case .scoresMain:
            viewController = storyboard.instantiateViewController(withIdentifier: viewCntrlID) as! ViewControllerScoresMain
        case .settingsMain:
            viewController = storyboard.instantiateViewController(withIdentifier: viewCntrlID) as! ViewControllerSettingsMain
        }
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve
        present(viewController, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
    
    @IBAction func goToGameMain(_ sender: Any) {
        goToStoryboard(uIStrb: "Game", viewCntrlID: "GameMainID", uIViewCntrl: .gameMain)
    }
    
    @IBAction func goToScoresMain(_ sender: Any) {
        goToStoryboard(uIStrb: "Scores", viewCntrlID: "ScoresMainID", uIViewCntrl: .scoresMain)
    }
    
    @IBAction func goToSettingsMain(_ sender: Any) {
        goToStoryboard(uIStrb: "Settings", viewCntrlID: "SettingsMainID", uIViewCntrl: .settingsMain)
    }
    
}

