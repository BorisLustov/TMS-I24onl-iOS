//
//  ViewControllerFiveStrb4.swift
//  HomeWork_08
//
//  Created by Борис Лустов on 30.06.22.
//

import UIKit

class ViewControllerFiveStrb4: UIViewController {
    
    private var text3 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .randomColor()
    }
    
    func set3(text3: String) {
        self.text3 = text3
    }
    
    @IBAction func toFiveScreen() {
        let fiveStoryboard = UIStoryboard(name: "FiveStoryboard", bundle: nil)
        let fiveScreenViewController = fiveStoryboard.instantiateViewController(withIdentifier: "FiveStrbFiveScreenID") as! ViewControllerFiveStrb5
        
        fiveScreenViewController.finalSet(text: text3)
        
        present(fiveScreenViewController, animated: true)
    }
    
}
