//
//  HomeViewController.swift
//  Pokedex
//
//  Created by Felipe Miranda Santos on 25/06/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configElements()
        viewModel.delegate = self
        searchBar.delegate = self
        viewModel.fetchPokemonURLSession()
    }
    
    func configTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PokemonTableViewCell.nib(), forCellReuseIdentifier: PokemonTableViewCell.identifier)
        tableView.separatorStyle = .none
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonTableViewCell.identifier, for: indexPath) as? PokemonTableViewCell
        cell?.setupCell(data: viewModel.getPokemon(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailsScreen = UIStoryboard(name: String(describing: PokemonDetailsViewController.self), bundle: nil).instantiateViewController(identifier: String(describing: PokemonDetailsViewController.self)) { coder -> PokemonDetailsViewController? in
            return PokemonDetailsViewController(coder: coder, pokemonDetails: self.viewModel.getPokemon(indexPath: indexPath))
        }
        
        self.navigationController?.pushViewController(detailsScreen, animated: true)
    }
    
    
}

extension HomeViewController: HomeViewModelProtocol {
    func successRequest() {
        configTableView()
        tableView.reloadData()
    }
    
    func errorRequest() {
        let alert = UIAlertController(title: "Error", message: "Failed to fetch Pokémon data. Please try again later.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterPokemon(searchText: searchText)
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        viewModel.filterPokemon(searchText: searchBar.text ?? "")
        tableView.reloadData()
    }
}

extension HomeViewController {
    
    func configElements() {
        
        tableView.layer.cornerRadius = 10
        tableView.clipsToBounds = true

        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = .white
            textField.layer.cornerRadius = 10
            textField.clipsToBounds = true
            if let backgroundView = textField.subviews.first {
                backgroundView.layer.cornerRadius = 10
                backgroundView.clipsToBounds = true
            }
        }
        
        searchBar.setImage(UIImage(named: "search_icon"), for: .search, state: .normal)
        searchBar.searchBarStyle = .minimal
        
        logoLabel.text = "Pokédex"
        logoLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 24)
        logoLabel.textColor = UIColor(red: 0.12, green: 0.63, blue: 0.95, alpha: 1.00)
        logoLabel.textAlignment = .center
    }
}
