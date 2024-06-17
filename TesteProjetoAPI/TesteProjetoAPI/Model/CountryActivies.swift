//
//  CountryActivies.swift
//  TesteProjetoAPI
//
//  Created by Felipe Miranda Santos on 17/06/24.
//

import Foundation

// MARK: - CountryActivies
struct CountryActivies: Codable {
    var data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    var activities: [Activity]
}

// MARK: - Activity
struct Activity: Codable {
    var title, activity: String
}
