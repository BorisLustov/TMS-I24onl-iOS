//
//  ViewController.swift
//  BeerBar
//
//  Created by Борис Лустов on 17.06.22.
//

import UIKit

// MARK: Classes

// class of beer bottle
class Beer {
    let name: String
    let price: Int
    let country: String
    var remainVolume: Double
    
    init(name: String, price: Int, country: String, remainVolume: Double) {
        self.name = name
        self.price = price
        self.country = country
        self.remainVolume = remainVolume
    }
    
}

// singleton manager class
class SellManager {
    static let shared = SellManager()
    var gain = 0
    var volume = 0.0
    // function buying beer
    func buyIt(_ n: Beer) {
        gain += n.price
        volume += 0.5
        n.remainVolume -= 0.5
    }
}

class ViewController: UIViewController {

    // MARK: Lables
    
    // lables names
    @IBOutlet weak var firstBeerNameLbl: UILabel!
    @IBOutlet weak var secondBeerNameLbl: UILabel!
    @IBOutlet weak var thirdBeerNameLbl: UILabel!
    // lables price
    @IBOutlet weak var firsBeerPriceLbl: UILabel!
    @IBOutlet weak var secondBeerPriceLbl: UILabel!
    @IBOutlet weak var thirdBeerPriceLbl: UILabel!
    // lables country
    @IBOutlet weak var firsBeerCountryLbl: UILabel!
    @IBOutlet weak var secondBeerCountryLbl: UILabel!
    @IBOutlet weak var thirdBeerCountryLbl: UILabel!
    // lables remain volume
    @IBOutlet weak var firsBeerRemVolumeLbl: UILabel!
    @IBOutlet weak var secondBeerRemVolumeLbl: UILabel!
    @IBOutlet weak var thirdBeerRemVolumeLbl: UILabel!
    
    // lables result
    @IBOutlet weak var totalCashLbl: UILabel!
    @IBOutlet weak var totalVolumeLbl: UILabel!
    
    // MARK: Buttons
    
    @IBOutlet weak var buyFirstBeerBtn: UIButton!
    @IBOutlet weak var buySecondBeerBtn: UIButton!
    @IBOutlet weak var buyThirdBeerBtn: UIButton!
    
    
    // MARK: Variables
    
    // creating instances of beer bottle
    var beerGuinness = Beer(name: "Guinness", price: 3, country: "Ireland", remainVolume: 100.0)
    var beerCorona = Beer(name: "Corona", price: 2, country: "Mexico", remainVolume: 100.0)
    var beerLidskae = Beer(name: "Lidskae", price: 1, country: "Belarus", remainVolume: 100.0)
    
    // MARK: Functions
    
    /// This function update lables on UI
    func updateUI() {
        // lables of total result
        totalCashLbl.text = "\(SellManager.shared.gain) $"
        totalVolumeLbl.text = "\(SellManager.shared.volume) L"
        // lables of remain volume beer
        firsBeerRemVolumeLbl.text = "\(beerGuinness.remainVolume) L"
        secondBeerRemVolumeLbl.text = "\(beerCorona.remainVolume) L"
        thirdBeerRemVolumeLbl.text = "\(beerLidskae.remainVolume) L"
    }
    
    /// Start UI function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // start lables name
        firstBeerNameLbl.text = beerGuinness.name
        secondBeerNameLbl.text = beerCorona.name
        thirdBeerNameLbl.text = beerLidskae.name
        
        // start lables price
        firsBeerPriceLbl.text = "\(beerGuinness.price) $"
        secondBeerPriceLbl.text = "\(beerCorona.price) $"
        thirdBeerPriceLbl.text = "\(beerLidskae.price) $"
        
        // start lables country
        firsBeerCountryLbl.text = beerGuinness.country
        secondBeerCountryLbl.text = beerCorona.country
        thirdBeerCountryLbl.text = beerLidskae.country
        
        updateUI()
    }
    
    /// Buying first beer bottle function
    @IBAction func buyFirstBeer(_ sender: Any) {
        SellManager.shared.buyIt(beerGuinness)
        updateUI()
        if beerGuinness.remainVolume < 0.5 {
            buyFirstBeerBtn.isEnabled = false
        }
    }
    /// Buying second beer bottle function
    @IBAction func buySecondBeer(_ sender: Any) {
        SellManager.shared.buyIt(beerCorona)
        updateUI()
        if beerCorona.remainVolume < 0.5 {
            buySecondBeerBtn.isEnabled = false
        }
    }
    /// Buying third beer bottle function
    @IBAction func buyThirdBeer(_ sender: Any) {
        SellManager.shared.buyIt(beerLidskae)
        updateUI()
        if beerLidskae.remainVolume < 0.5 {
            buyThirdBeerBtn.isEnabled = false
        }
    }
    /// The function of starting a new shift (reset total cash and total volume of beer)
    @IBAction func startNewShift(_ sender: Any) {
        SellManager.shared.gain = 0
        SellManager.shared.volume = 0.0
        updateUI()
    }
    /// Updating remains volume of beer to 100 L
    @IBAction func updateRemains(_ sender: Any) {
        beerGuinness.remainVolume = 100.0
        beerCorona.remainVolume = 100.0
        beerLidskae.remainVolume = 100.0
        buyFirstBeerBtn.isEnabled = true
        buySecondBeerBtn.isEnabled = true
        buyThirdBeerBtn.isEnabled = true
        updateUI()
    }
    
}

