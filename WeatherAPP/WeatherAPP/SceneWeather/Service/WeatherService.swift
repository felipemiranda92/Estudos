//
//  WeatherService.swift
//  WeatherAPP
//
//  Created by Felipe Miranda Santos on 18/06/24.
//

import Foundation

class WeatherService {
    
    func getWeatherURLSession(cityName: String, completion: @escaping (Result<Weather, Error>) -> Void) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=B02099dee5559d260c3803a77cf18332") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let dataResult = data else { return }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                do {
                    let weather: Weather = try JSONDecoder().decode(Weather.self, from: dataResult)
                    completion(.success(weather))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(error ?? NSError(domain: "Erro: ", code: response.statusCode)))
            }
        }
        task.resume()
    }
}
