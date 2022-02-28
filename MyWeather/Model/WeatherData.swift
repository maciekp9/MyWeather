//
//  WeatherData.swift
//  MyWeather
//
//  Created by Maciej Przydatek on 28/02/2022.
//

import Foundation

struct WeatherData: Codable{
    let name: String
    let temp: Double
    let rainChange: Int
    let description: String
    let id: Int
    
    
    
}
