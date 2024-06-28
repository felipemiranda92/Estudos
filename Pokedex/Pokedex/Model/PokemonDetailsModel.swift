//
//  PokemonDetailsModel.swift
//  Pokedex
//
//  Created by Felipe Miranda Santos on 26/06/24.
//

import Foundation

struct PokemonDetails: Codable {
    var sprites: PokemonSprites
    var weight: Int
}

struct PokemonSprites: Codable {
    var frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}


struct PokemonDisplayData {
    var name: String
    var imageUrl: String?
    var weight: Int?
}

