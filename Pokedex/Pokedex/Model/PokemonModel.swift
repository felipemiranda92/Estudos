//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Felipe Miranda Santos on 25/06/24.
//

import Foundation

// MARK: - Pokemon
struct Pokemon: Codable {
    var count: Int?
    var next: String?
    var previous: JSONNull?
    var results: [PokemonResult]?
}

// MARK: - PokemonResult
struct PokemonResult: Codable {
    var name: String?
    var url: String?
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
