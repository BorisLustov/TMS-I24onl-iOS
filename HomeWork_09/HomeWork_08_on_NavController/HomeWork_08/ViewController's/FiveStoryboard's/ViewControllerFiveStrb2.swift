//
//  ViewControllerFiveStrb2.swift
//  HomeWork_08
//
//  Created by Борис Лустов on 30.06.22.
//

import UIKit

class ViewControllerFiveStrb2: UIViewController {
    
    private var text1 = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .randomColor()
    }
    
    func set1(text1: String) {
        self.text1 = text1
    }
    
    @IBAction func toThirdScreen() {
        let fiveStoryboard = UIStoryboard(name: "FiveStoryboard", bundle: nil)
        let thirdScreenViewController = fiveStoryboard.instantiateViewController(withIdentifier: "FiveStrbThirdScreenID") as! ViewControllerFiveStrb3
        
        thirdScreenViewController.set2(text2: text1)
        
        navigationController?.pushViewController(thirdScreenViewController, animated: true)
    }
}
