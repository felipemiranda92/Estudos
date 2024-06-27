import Foundation

protocol HomeViewModelProtocol: AnyObject {
    func successRequest()
    func errorRequest()
}

class HomeViewModel {
    
    private var service: PokemonService = PokemonService()
    private var pokemon: Pokemon?
    private var pokemonDetails: [Int: PokemonDetails] = [:]
    weak var delegate: HomeViewModelProtocol?
    
    func fetchPokemonURLSession() {
        service.getPokemonURLSession { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    self.pokemon = success
                    self.fetchPokemonDetailsForAll()
                    self.delegate?.successRequest()
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
        return pokemon?.results?.count ?? 0
    }
    
    func getPokemon(indexPath: IndexPath) -> PokemonDisplayData {
        guard let results = pokemon?.results, indexPath.row < results.count else {
            return PokemonDisplayData(name: "", imageUrl: nil)
        }
        
        var name = results[indexPath.row].name ?? ""
        name = name.capitalizingFirstLetter()
        let imageUrl = pokemonDetails[indexPath.row]?.sprites.frontDefault
        
        return PokemonDisplayData(name: name, imageUrl: imageUrl)
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
