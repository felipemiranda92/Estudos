//
//  EmbassyDetails.swift
//  TesteProjetoAPI
//
//  Created by Felipe Miranda Santos on 17/06/24.
//

import Foundation

// MARK: - ListCountry
struct EmbassyAbroad: Codable {
    var data: [EmbassyAbroadDetail]?
}

// MARK: - Datum
struct EmbassyAbroadDetail: Codable {
    var address, phone: String?
}
