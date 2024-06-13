//
//  HistoryTableViewCell.swift
//  praticandoRequisicaoAPI
//
//  Created by Felipe Miranda Santos on 13/06/24.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    static let identifier: String = String(describing: HistoryTableViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configCell()
        
    }
    
    public func setupCell(data: HistoryAccountList) {
        nameLabel.text = data.name
        priceLabel.text = "R$ \(data.price)"
    }
    
    func configCell() {
        selectionStyle = .none
    }
}
