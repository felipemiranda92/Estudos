//
//  History.swift
//  praticandoRequisicaoAPI
//
//  Created by Felipe Miranda Santos on 13/06/24.
//

import Foundation

//Objeto History fornecido pelo site QuickType para o nosso JSON fornecido.

// MARK: - History
struct History: Codable {
    var totalValue: Double
    var historyAccountList: [HistoryAccountList]
}

// MARK: - HistoryAccountList
struct HistoryAccountList: Codable {
    var name: String
    var price: Double
    var iconImage: String
}
