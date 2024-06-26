//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Felipe Miranda Santos on 25/06/24.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    func successRequest()
    func errorRequest()
}

class HomeViewModel {
    
    private var service: PokemonService = PokemonService()
    private var pokemon: Pokemon?
    weak var delegate: HomeViewModelProtocol?
    
    
    func fetchPokemonURLSession() {
        service.getPokemonURLSession { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    self.pokemon = success
                    self.delegate?.successRequest()
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
    
    func numberOfRows() -> Int {
        return pokemon?.results?.count ?? 0
    }
    
    func getPokemon(indexPath: IndexPath) -> PokemonResult {
        guard let results = pokemon?.results, indexPath.row < results.count else {
            return PokemonResult(name: "", url: "")
        }
        return results[indexPath.row]
    }
}
