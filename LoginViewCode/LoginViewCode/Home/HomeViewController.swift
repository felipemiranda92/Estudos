//
//  HomeViewController.swift
//  LoginViewCode
//
//  Created by Felipe Miranda Santos on 23/07/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var screen = HomeScreen?(HomeScreen())
    
    var personList: [Person] = [Person(name: "Felipe", lastName: "Miranda"),
                                Person(name: "Maria Luiza", lastName: "Fedricci"),
                                Person(name: "Petronio", lastName: "Santos"),
                                Person(name: "Rosemary", lastName: "Miranda"),
                                Person(name: "Larissa", lastName: "Santos"),
                                Person(name: "Vinicius", lastName: "Miranda"),
                                Person(name: "Felipe", lastName: "Miranda")
    ]
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        screen?.configTableViewDelegate(delegate: self, dataSource: self)

    }
    

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier, for: indexPath) as? PersonTableViewCell
        cell?.setupCell(data: personList[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    
}
