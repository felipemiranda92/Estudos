//
//  HistoryViewModel.swift
//  praticandoRequisicaoAPI
//
//  Created by Felipe Miranda Santos on 13/06/24.
//

import Foundation

class HistoryViewModel {
    
    var service: HistoryService = HistoryService()
    
    func fetchHistory() {
        service.getHistoryMock { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
}
