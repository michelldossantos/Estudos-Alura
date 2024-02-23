//
//  QuestionModel.swift
//  ProjetoAluraUiKIT
//
//  Created by Michel Santos on 22/02/24.
//

import Foundation

struct Question {
    let title: String
    let awnsers: [String]
    let rightAnswer: Int
}

let questions: [Question] = [
    .init(title: "Qual feitiço para desarmar o seu oponente, em Harry Potter?",
          awnsers: ["Expectro Patronum", "Avada Kedavra", "Expelliarmus"],
          rightAnswer: 2),
    .init(title: "Quando foi lançado o filme Avatar 2?",
          awnsers: ["2014", "2022", "2023"],
          rightAnswer: 1),
    .init(title: "Quando foi lançado o filme Vingadores Ultimato?",
          awnsers: ["2019", "2018", "2017"],
          rightAnswer: 0),
    .init(title: "Qual é o primeiro filme da franquia Star Wars?",
          awnsers: ["Star Wars: A Ameaça Fantasma", "Star Wars: Uma Nova Esperança", "Star Wars: O Império Contra-Ataca"],
          rightAnswer: 1),
    .init(title: "Qual é o primeiro filme do Universo Cinematográfico Marvel (MCU)?",
          awnsers: ["Homem de Ferro", "Capitão América: O Primeiro Vingador", "Thor"],
          rightAnswer: 0),
    .init(title: "Qual é o personagem principal de The Office, interpretado por Steve Carell?",
          awnsers: ["Michael Scott", "Jim Halpert", "Dwight Schrute"],
          rightAnswer: 0),
    .init(title: "Qual é o trabalho de Jay Pritchett na série Modern Family?",
          awnsers: ["Médico", "Empresário", "Advogado"],
          rightAnswer: 1),
]
