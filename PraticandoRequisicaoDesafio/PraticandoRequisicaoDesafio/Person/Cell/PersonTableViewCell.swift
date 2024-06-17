//
//  PersonTableViewCell.swift
//  PraticandoRequisicaoDesafio
//
//  Created by Felipe Miranda Santos on 14/06/24.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    static let identifier: String = String(describing: PersonTableViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(data: Pessoa) {
        nameLabel.text = "Nome: \(data.nome)"
        lastNameLabel.text = "Sobrenome: \(data.sobrenome)"
        ageLabel.text = "Idade: \(data.idade)"
        jobLabel.text = "Profissão: \(data.profissao)"
    }

    
}
