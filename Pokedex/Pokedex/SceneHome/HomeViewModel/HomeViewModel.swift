//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Felipe Miranda Santos on 25/06/24.
//

import Foundation

class HomeViewModel {
    
    private var service: PokemonService = PokemonService()
    private var pokemon: Pokemon?
    
    func fetchPokemon(completion: @escaping (String?) -> Void) {
        service.getPokemonURLSession() { result in
            switch result {
            case .success(let success):
                self.pokemon = success
                print(success)
                completion(nil)
            case .failure(let failure):
                print(failure.localizedDescription)
                completion(failure.localizedDescription)
            }
        }
    }
    
    func numberOfRows() -> Int {
        return pokemon?.results?.count ?? 0
    }
}
