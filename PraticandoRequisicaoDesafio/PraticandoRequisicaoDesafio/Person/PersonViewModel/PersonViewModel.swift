//
//  PersonViewModel.swift
//  PraticandoRequisicaoDesafio
//
//  Created by Felipe Miranda Santos on 14/06/24.
//

import Foundation

protocol PersonViewModelProtocol: AnyObject {
    func successRequest()
    func errorRequest()
}

class PersonViewModel {
    
    private var service: PersonService = PersonService()
    private var person: Person?
    weak var delegate: PersonViewModelProtocol?
    
//    func fetchHistoryAlamofire() {
//        service.getHistoryAlamofire { result in
//            switch result {
//            case .success(let success):
//                self.history = success
//                self.delegate?.successRequest()
//            case .failure(_):
//                self.delegate?.errorRequest()
//            }
//        }
//    }
    
    func fetchPersonURLSession() {
        service.getPersonURLSession { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    self.person = success
                    self.delegate?.successRequest()
                case .failure(_):
                    self.delegate?.errorRequest()
                }
            }
        }
    }
    
    
    func fetchPersonMock() {
        service.getPersonMock { result in
            switch result {
            case .success(let success):
                person = success
                delegate?.successRequest()
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func numberOfRows() -> Int {
        person?.pessoas.count ?? 0
    }
    
    func getPessoas(indexPath: IndexPath) -> Pessoa {
        return person?.pessoas[indexPath.row] ?? Pessoa(nome: "", sobrenome: "", idade: 0, profissao: "")
    }
    
}
