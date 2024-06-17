//
//  PersonService.swift
//  PraticandoRequisicaoDesafio
//
//  Created by Felipe Miranda Santos on 14/06/24.
//

import Foundation


class PersonService {
    
//    func getHistoryAlamofire(completion: @escaping (Result<History, Error>) -> Void) {
//        let urlString = "https://run.mocky.io/v3/1ce2ff7c-d097-41bc-842f-a9b0813e3a54"
//        AF.request(urlString, method: .get).responseDecodable(of: History.self) { response in
//            switch response.result {
//            case .success(let history):
//                completion(.success(history))
//            case .failure(let failure):
//                completion(.failure(failure))
//            }
//        }
//    }
    
    func getPersonURLSession(completion: @escaping (Result<Person, Error>) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/92b8f3c0-d9cb-458b-bc85-de350229f0b2") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let dataResult = data else { return }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                do {
                    let person: Person = try JSONDecoder().decode(Person.self, from: dataResult)
                    completion(.success(person))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(error ?? NSError(domain: "ERRO!!", code: response.statusCode)))
            }
        }
        task.resume()
    }
    
    func getPersonMock(completion: (Result<Person, Error>) -> Void) {
        if let url = Bundle.main.url(forResource: "Person", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let person: Person = try JSONDecoder().decode(Person.self, from: data)
                completion(.success(person))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
}
