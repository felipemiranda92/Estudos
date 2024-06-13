//
//  HistoryViewModel.swift
//  praticandoRequisicaoAPI
//
//  Created by Felipe Miranda Santos on 13/06/24.
//

import Foundation

protocol HistoryViewModelProtocol: AnyObject {
    func successRequest()
}

class HistoryViewModel {
    
    private var service: HistoryService = HistoryService()
    private var history: History?
    weak var delegate: HistoryViewModelProtocol?
    
    func fetchHistory() {
        service.getHistoryMock { result in
            switch result {
            case .success(let success):
                history = success
                delegate?.successRequest()
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func numberOfRows() -> Int {
        return history?.historyAccountList.count ?? 0
    }
    
    func getHistoryAccountList(indexPath: IndexPath) -> HistoryAccountList {
        return history?.historyAccountList[indexPath.row] ?? HistoryAccountList(name: "", price: 0, iconImage: "")
    }
    
}
