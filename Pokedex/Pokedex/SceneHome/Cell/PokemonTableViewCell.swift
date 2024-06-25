//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by Felipe Miranda Santos on 25/06/24.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: PokemonTableViewCell.self)
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell(data: PokemonResult) {
        pokemonNameLabel.text = data.name
    }
    
}
