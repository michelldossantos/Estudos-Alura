import UIKit
typealias Pessoa = (nome: String, idade: Int, estudante: Bool)

let pessoa: Pessoa = ("Michel", 31, false)

let (_, idade ,_) = pessoa

print(idade)

struct ContaCorrente {
    var saldo: Double = 0.0
    
    mutating func adicionarSaldo(valor: Double) {
        saldo = -valor
    }
}
