//
//  HistoryService.swift
//  praticandoRequisicaoAPI
//
//  Created by Felipe Miranda Santos on 13/06/24.
//

import Foundation

class HistoryService {
    
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
