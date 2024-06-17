//
//  PersonModel.swift
//  PraticandoRequisicaoDesafio
//
//  Created by Felipe Miranda Santos on 14/06/24.
//

import Foundation

// MARK: - Person
struct Person: Codable {
    var pessoas: [Pessoa]
}

// MARK: - Pessoa
struct Pessoa: Codable {
    var nome, sobrenome: String
    var idade: Int
    var profissao: String
}
