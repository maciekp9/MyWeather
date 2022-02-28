//
//  WeatherManager.swift
//  MyWeather
//
//  Created by Maciej Przydatek on 28/02/2022.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate{
    func ifUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func ifError(error: Error)
    
}


struct WeatherManager {
    
    let apiKey = weatherApiKey
    let baseURL = "https://api.openweathermap.org/data/2.5/weather?"
    let units = "metric"
    
    var delegate: WeatherManagerDelegate?
    
    
    func getRequestURL(lat: CLLocationDegrees, long: CLLocationDegrees){
        let urlString = "\(baseURL)appid=\(apiKey)?units=\(units)?lat=\(lat)?lon=\(long)"
        // perform URL requst To Do
    }
    
    
    func getRequestURL(city: String){
        let urlString = "\(baseURL)appid=\(apiKey)?units=\(units)?q=\(city)"
        // perform URL requst To Do
    }
    
    
    
    
    
    
    
    func doRequest(using urlString: String){
        
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){ (data,response, error) in
                if error != nil {
                    self.delegate?.ifError(error: error!)
                    return
                }
                if let safeData = data{
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.ifUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
        }
        
    }
    
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let name = decodedData.name
            
            let weather = WeatherModel(city: name, temperature: 20.0, rainChance: 30, time: "XD")
            return weather
            
        }catch {
            delegate?.ifError(error: error)
            return nil
        }
        
        
        
    }
    
    
    
    
    
}
