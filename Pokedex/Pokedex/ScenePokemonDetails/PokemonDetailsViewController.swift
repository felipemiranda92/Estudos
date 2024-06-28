//
//  PokemonDetailsViewController.swift
//  Pokedex
//
//  Created by Felipe Miranda Santos on 28/06/24.
//

import UIKit
import SDWebImage

class PokemonDetailsViewController: UIViewController {

    @IBOutlet weak var namePokemonLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var weightPokemonLabel: UILabel!
    
    var pokemonDetails: PokemonDisplayData?
    
    
    init?(coder: NSCoder, pokemonDetails: PokemonDisplayData) {
        self.pokemonDetails = pokemonDetails
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
        configElements()
    }
    
    func setupElements() {
        
        if let name = pokemonDetails?.name {
            namePokemonLabel.text = "\(name)"
        } else {
            namePokemonLabel.text = ""
        }
        
        if let imageUrlString = pokemonDetails?.imageUrl, let imageUrl = URL(string: imageUrlString) {
            pokemonImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "placeholder"))
        } else {
            pokemonImageView.image = UIImage(named: "placeholder")
        }
        
        if let weight = pokemonDetails?.weight {
            weightPokemonLabel.text = "Weight: \(weight) kg"
        } else {
            weightPokemonLabel.text = ""
        }
        
    }
    
    func configElements() {
        namePokemonLabel.font = UIFont.boldSystemFont(ofSize: 24)
        namePokemonLabel.textColor = UIColor.systemBlue
        namePokemonLabel.textAlignment = .center
        
        weightPokemonLabel.font = UIFont.systemFont(ofSize: 18)
        weightPokemonLabel.textColor = UIColor.systemGray
        weightPokemonLabel.textAlignment = .center
        
        pokemonImageView.layer.cornerRadius = pokemonImageView.frame.size.width / 2
        pokemonImageView.clipsToBounds = true
        
        pokemonImageView.layer.borderWidth = 0.5
        pokemonImageView.layer.borderColor = UIColor.systemBlue.cgColor
        
        let backgroundLayer = CALayer()
        backgroundLayer.frame = pokemonImageView.bounds
        backgroundLayer.backgroundColor = UIColor.systemGray.withAlphaComponent(0.2).cgColor
        backgroundLayer.cornerRadius = pokemonImageView.layer.cornerRadius
        backgroundLayer.masksToBounds = true
        
        pokemonImageView.layer.insertSublayer(backgroundLayer, at: 0)
    }
    
}
