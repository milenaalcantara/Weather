//
//  Service.swift
//  Weather
//
//  Created by Milena Alcântara on 14/04/24.
//

import Foundation

struct City: Codable {
    let lat: String
    let lon: String
    let name: String
}

class Service {
    private let baseURL = "https://api.openweathermap.org/data/3.0/onecall"
    private let apiKey = "325ecb9952c63615d6ac5a7831d94350"
    private let session = URLSession.shared
    
    func fetchData(city: City, _ completion: @escaping (ForecastResponse?) -> Void) {
        let urlString = "\(baseURL)?lat=\(city.lat)&lon=\(city.lon)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else { return }
        
        let task = session.dataTask(
            with: url) { data, response, error in
                guard let data else {
                    completion(nil)
                    return
                }
                
                do {
                    let forecastResponse = try JSONDecoder().decode(
                        ForecastResponse.self,
                        from: data
                    )
                    completion(forecastResponse)
                } catch {
                    print("ERROR: \(error)")
                    completion(nil)
                }
                
                completion(nil)
            }
        
        task.resume()
    }
}
