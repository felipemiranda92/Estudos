//
//  ViewController.swift
//  PraticandoRequisicaoDesafio
//
//  Created by Felipe Miranda Santos on 14/06/24.
//

import UIKit

class PersonViewController: UIViewController {
    
    var viewModel: PersonViewModel = PersonViewModel()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
//        viewModel.fetchPersonMock()
        viewModel.fetchPersonURLSession()
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PersonTableViewCell.nib(), forCellReuseIdentifier: PersonTableViewCell.identifier)
    }


}

extension PersonViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier, for: indexPath) as? PersonTableViewCell
        cell?.setupCell(data: viewModel.getPessoas(indexPath: indexPath))
        return cell ??  UITableViewCell()
    }
    
    
}

extension PersonViewController: PersonViewModelProtocol {
    func errorRequest() {
        //Exibimos algum tipo de alert
    }
    
    func successRequest() {
        configTableView()
        
    }
    
}
