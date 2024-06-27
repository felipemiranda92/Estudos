////
////  PokemonTableViewCell.swift
////  Pokedex
////
////  Created by Felipe Miranda Santos on 25/06/24.
////
//

import UIKit
import SDWebImage

class PokemonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    static let identifier: String = String(describing: PokemonTableViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configCell()
    }
    
    func configCell() {
        pokemonImageView.layer.cornerRadius = pokemonImageView.frame.size.width / 2
        pokemonImageView.clipsToBounds = true
        self.accessoryType = .disclosureIndicator
        self.selectionStyle = .none
    }
    
    func setupCell(data: PokemonDisplayData) {
        pokemonNameLabel.text = data.name
        if let imageUrlString = data.imageUrl, let imageUrl = URL(string: imageUrlString) {
            pokemonImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "placeholder"))
        } else {
            pokemonImageView.image = UIImage(named: "placeholder")
        }
    }
}
