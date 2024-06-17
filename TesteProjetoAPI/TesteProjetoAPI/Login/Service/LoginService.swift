//
//  LoginService.swift
//  TesteProjetoAPI
//
//  Created by Felipe Miranda Santos on 17/06/24.
//

import Foundation

class LoginService {
    
    func getEmbassyAbroadURLSession(completion: @escaping (Result<EmbassyAbroad, Error>) -> Void) {
        guard let url = URL(string: "https://travel-info-api.p.rapidapi.com/find-embassy?source=turkey&destination=usa") else { return }
        
        let headers = [
            "x-rapidapi-key": "9f316599d7mshbae612eb4cb0a58p1e2f20jsn2ab7a9d1b57e",
            "x-rapidapi-host": "travel-info-api.p.rapidapi.com"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let dataResult = data else { return }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                do {
                    let embassyAbroad: EmbassyAbroad = try JSONDecoder().decode(EmbassyAbroad.self, from: dataResult)
                    completion(.success(embassyAbroad))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(error ?? NSError(domain: "Deu ruim em", code: response.statusCode)))
            }
        }
        task.resume()
    }
    
    
    func getCountryActiviesURLSession(country: String, completion: @escaping (Result<CountryActivies, Error>) -> Void) {
        
        guard let url = URL(string: "https://travel-info-api.p.rapidapi.com/country-activities?country=\(country)") else { return }
        
        let headers = [
            "x-rapidapi-key": "9f316599d7mshbae612eb4cb0a58p1e2f20jsn2ab7a9d1b57e",
            "x-rapidapi-host": "travel-info-api.p.rapidapi.com"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let dataResult = data else { return }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                do {
                    let countryActivies: CountryActivies = try JSONDecoder().decode(CountryActivies.self, from: dataResult)
                    completion(.success(countryActivies))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(error ?? NSError(domain: "ERRO!!", code: response.statusCode)))
            }
        }
        task.resume()
    }
    
}
