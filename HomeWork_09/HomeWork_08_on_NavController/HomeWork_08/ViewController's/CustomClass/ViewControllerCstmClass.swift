//
//  ViewControllerCstmClass.swift
//  HomeWork_08
//
//  Created by Борис Лустов on 30.06.22.
//

import UIKit

class MyCustomClassCar {
    var carBrand: String
    var carModel: String
    var fuelType: String
    
    init(carBrand: String, carModel: String, fuelType: String) {
        self.carBrand = carBrand
        self.carModel = carModel
        self.fuelType = fuelType
    }

}

let objectOfClass = MyCustomClassCar(carBrand: "BMW", carModel: "330D", fuelType: "Diesel")

class ViewControllerCstmClass: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
    }
    
    @IBAction func toSecondScreenCstmClass(_ sender: Any) {
        let storyboardCustomClass = UIStoryboard(name: "CustomClass", bundle: nil)
        let secondScreenViewController = storyboardCustomClass.instantiateViewController(withIdentifier: "CstmClassSecondScreenID") as! ViewControllerCstmClass2
        secondScreenViewController.getLablesText(obj: objectOfClass)
        
        navigationController?.pushViewController(secondScreenViewController, animated: true)
        
    }
}

