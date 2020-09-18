import UIKit
//- Um vendedor de loja e possui nome, idade e cpf, saldo em conta
//    - vende em sua loja ternos, vestidos e bonés
//    - definir um método vender (quantidadeDePecas: Int, tipoDePeca: String).
//- Cada terno custa 400 reais,
//   - caso o cliente compre 3 ou mais ternos, ele recebe 50 de desconto para cada terno.
//- Cada vestido custa 900 reais,
//   - caso o cliente compre 5 vestidos ele ganha um véu de noiva (que custa 250 reais) de brinde.
//- Cada boné custa 50 reais, e para cada 2 bonés vendidos, o terceiro é grátis, logo não haverá lucro.
//- Encapsule todos os métodos necessários.

public class Vendedor {
    var nome: String
    var idade: Int
    var cpf: String
    private var saldoEmConta: Double
    
    init(nome:String,
         idade: Int,
         cpf: String,
         saldoEmConta: Double) {
        self.nome = nome
        self.idade = idade
        self.cpf = cpf
        self.saldoEmConta = saldoEmConta
    }
    //Sempre retornando no saldo existente
    func getSaldo() {
        
        print("Seu Saldo Vendedor: R$ \(self.saldoEmConta)")
    }
    
    func vender(quantidadeDePecas: Int, tipoDePeca: String) {
        
        if tipoDePeca == "terno" {
            if quantidadeDePecas >= 3 {
                
                let desconto = 50.00 * Double(quantidadeDePecas)
                let valorDeVenda = (400.00  * Double(quantidadeDePecas) ) - desconto
                self.saldoEmConta +=  valorDeVenda
                
            } else {
            
                let valorDeVenda = (400.00 * Double(quantidadeDePecas))
                self.saldoEmConta  = saldoEmConta + valorDeVenda
            }
            
            
        } else if tipoDePeca == "vestido" {
           if quantidadeDePecas == 5 {
            
              let valorDeVenda = (900.00 * Double(quantidadeDePecas) - 250.00)
              self.saldoEmConta  = saldoEmConta + valorDeVenda
           
           } else {
           
                let valorDeVenda = 900.00 * Double(quantidadeDePecas)
                self.saldoEmConta  = saldoEmConta + valorDeVenda
           }
            
            
        } else {
           
            if quantidadeDePecas >= 2 {

                if quantidadeDePecas % 2 == 0 {
                    
                    let valorDeVenda = Double(quantidadeDePecas) * 50.00
                    self.saldoEmConta  = saldoEmConta + valorDeVenda
                    
                } else {
                 
                    let valorDeVenda = Double(quantidadeDePecas) * 50.00
                  
                    self.saldoEmConta  = saldoEmConta + valorDeVenda
                    
                }
              
                
            } else {
                
                let valorDeVenda = 50.00 * Double(quantidadeDePecas)
                self.saldoEmConta  = saldoEmConta + valorDeVenda
                
            }
            
            
        }
        
    }
    
}

let jonas = Vendedor(nome: "Jonas", idade: 32, cpf: "999.999.999-00", saldoEmConta: 1465)
jonas.vender(quantidadeDePecas: 7, tipoDePeca: "bone")
jonas.getSaldo()


let caio = Vendedor(nome: "Caio", idade: 25, cpf: "111.111.111-00", saldoEmConta: 2230)
caio.vender(quantidadeDePecas: 5, tipoDePeca: "vestido")
caio.getSaldo()

let isabela = Vendedor(nome: "Isabela", idade: 31, cpf: "222.222.222-99", saldoEmConta: 3500)
isabela.vender(quantidadeDePecas: 7, tipoDePeca: "terno")
isabela.getSaldo()
