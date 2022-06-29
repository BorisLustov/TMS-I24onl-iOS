//
//  ViewControllerFiveStrb3.swift
//  HomeWork_08
//
//  Created by Борис Лустов on 30.06.22.
//

import UIKit

class ViewControllerFiveStrb3: UIViewController {
    
    private var text2 = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .randomColor()
    }
    
    func set2(text2: String) {
        self.text2 = text2
    }
    
    @IBAction func toFourScreen() {
        let fiveStoryboard = UIStoryboard(name: "FiveStoryboard", bundle: nil)
        let fourScreenViewController = fiveStoryboard.instantiateViewController(withIdentifier: "FiveStrbFourScreenID") as! ViewControllerFiveStrb4
        
        fourScreenViewController.set3(text3: text2)
        
        present(fourScreenViewController, animated: true)
    }
    
}
