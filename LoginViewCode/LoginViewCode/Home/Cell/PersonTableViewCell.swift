//
//  PersonTableViewCell.swift
//  LoginViewCode
//
//  Created by Felipe Miranda Santos on 24/07/24.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: PersonTableViewCell.self)
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 10)
        return label
    }()
    
    lazy var lastNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 10)
        return label
    }()
    
override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setupCell(data: Person) {
        nameLabel.text = data.name
        lastNameLabel.text = data.lastName
    }
    
    
    private func addElements() {
        addSubview(nameLabel)
        addSubview(lastNameLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5),
        
            lastNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            lastNameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            lastNameLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -5)
        
        ])
    }
    
    

}
