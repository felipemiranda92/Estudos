//
//  PokemonService.swift
//  Pokedex
//
//  Created by Felipe Miranda Santos on 25/06/24.
//

import Foundation

class PokemonService {
    
    func getPokemonURLSession(completion: @escaping (Result<Pokemon, Error>) -> Void) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let dataResult = data else { return }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                do {
                    let pokemon: Pokemon = try JSONDecoder().decode(Pokemon.self, from: dataResult)
                    completion(.success(pokemon))
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
