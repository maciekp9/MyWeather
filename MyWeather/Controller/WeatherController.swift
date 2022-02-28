//
//  ViewController.swift
//  MyWeather
//
//  Created by Maciej Przydatek on 27/02/2022.
//

import UIKit
import CoreLocation

class WeatherController: UIViewController {

    
    @IBOutlet weak var searchCityBar: UISearchBar!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var rainPercentLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension WeatherController: UITextFieldDelegate{
    
    @IBAction func searchPressed(_ sender: UIButton){
       print("Button pressed")
        searchCityBar.endEditing(true)
    }
    
    
}
