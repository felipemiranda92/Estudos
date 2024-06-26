//
//  HistoryService.swift
//  praticandoRequisicaoAPI
//
//  Created by Felipe Miranda Santos on 13/06/24.
//

import Foundation
import Alamofire

class HistoryService {
    
    func getHistoryAlamofire(completion: @escaping (Result<History, Error>) -> Void) {
        let urlString = "https://run.mocky.io/v3/4fc3c22c-2094-400d-8223-8fe95691aca2"
        AF.request(urlString, method: .get).responseDecodable(of: History.self) { response in
            switch response.result {
            case .success(let history):
                completion(.success(history))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
    
    // Usamos o @escaping pois é assíncrono. Ou seja, só função só será encerrada quando tivermos concluído o completion
    
    func getHistoryURLSession(completion: @escaping (Result<History, Error>) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/4fc3c22c-2094-400d-8223-8fe95691aca2") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let dataResult = data else { return }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                do {
                    let history: History = try JSONDecoder().decode(History.self, from: dataResult)
                    completion(.success(history))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(error ?? NSError(domain: "ERRO!!", code: response.statusCode)))
            }
        }
        task.resume()
    }
    
    // Leitura de dados dentro do arquivo, ou seja, síncrona
    
    func getHistoryMock(completion: (Result<History, Error>) -> Void) {
        if let url = Bundle.main.url(forResource: "History", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let history: History = try JSONDecoder().decode(History.self, from: data)
                completion(.success(history))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
}
