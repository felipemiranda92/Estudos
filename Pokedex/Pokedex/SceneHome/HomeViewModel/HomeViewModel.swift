import Foundation

protocol HomeViewModelProtocol: AnyObject {
    func successRequest()
    func errorRequest()
}

class HomeViewModel {
    
    private var service: PokemonService = PokemonService()
    private var pokemon: Pokemon?
    private var pokemonDetails: [Int: PokemonDetails] = [:]
    private var filteredPokemon: [PokemonResult] = []
    weak var delegate: HomeViewModelProtocol?
    
    func fetchPokemonURLSession() {
        service.getPokemonURLSession { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    self.pokemon = success
                    if let results = success.results {
                        self.filteredPokemon = results
                        self.fetchPokemonDetailsForAll()
                        self.delegate?.successRequest()
                    } else {
                        self.delegate?.errorRequest()
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                    self.delegate?.errorRequest()
                }
            }
        }
    }
    
    func fetchPokemonDetailsForAll() {
        guard let results = pokemon?.results else { return }
        for (index, result) in results.enumerated() {
            if let url = result.url {
                fetchPokemonDetailsURLSession(url: url, index: index)
            }
        }
    }
    
    func fetchPokemonDetailsURLSession(url: String, index: Int) {
        service.getPokemonDetailsURLSession(url: url) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    self.pokemonDetails[index] = success
                    self.delegate?.successRequest()
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }

    
    func numberOfRows() -> Int {
        return filteredPokemon.count
    }
    
    func getPokemon(indexPath: IndexPath) -> PokemonDisplayData {
        guard indexPath.row < filteredPokemon.count else {
            return PokemonDisplayData(name: "", imageUrl: nil, weight: nil, originalIndex: -1)
        }

        let result = filteredPokemon[indexPath.row]
        var name = result.name ?? ""
        name = name.capitalizingFirstLetter()
        let originalIndex = pokemon?.results?.firstIndex(where: { $0.name == result.name }) ?? -1
        let imageUrl = originalIndex >= 0 ? pokemonDetails[originalIndex]?.sprites.frontDefault : nil
        let weight = originalIndex >= 0 ? pokemonDetails[originalIndex]?.weight : nil

        return PokemonDisplayData(name: name, imageUrl: imageUrl, weight: weight, originalIndex: originalIndex)
    }
    
    func filterPokemon(searchText: String) {
        if searchText.isEmpty {
            filteredPokemon = pokemon?.results ?? []
        } else {
            filteredPokemon = pokemon?.results?.filter { pokemon in
                pokemon.name?.lowercased().contains(searchText.lowercased()) ?? false
            } ?? []
        }
    }
}


extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
