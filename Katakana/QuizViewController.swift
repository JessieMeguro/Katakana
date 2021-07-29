//
//  QuizViewController.swift
//  Katakana
//
//  Created by Jessica Akemi Meguro on 28/07/21.
//

import UIKit

class QuizViewController: UIViewController {
    
    var perguntaAtual : String! //tenho certeza do que eu to fazendo !
    let perguntas = ["WA","RA","YA","MA","HA","NA","TA","SA","KA","A","RI","MI","HI","NI","CHI","SHI","KI","I","WO","RU","YU","MU","FU","NU","TSU","SU","KU","U","RE","ME","HE","NE","TE","SE","KE","E","N","RO","YO","MO","HO","NO","TO","SO","KO","O"]

    @IBOutlet weak var caractereImageView: UIImageView!
    
    @IBOutlet weak var resposta1Button: UIButton!
    
    @IBOutlet weak var resposta2Button: UIButton!
    
    @IBOutlet weak var resposta3Button: UIButton!
    
    @IBOutlet weak var resposta4Button: UIButton!
    
    
    //Pode alterar o botão (texto, opacidade, etc) mas não pode fazer nada com ele. //

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Tudo que estiver aqui vai acontecer antes de clicar para ativar o controller.
        gerarPerguntaAleatoria()
        gerarRespostaAleatoria()
      
    }
    //Lugar de ações - tem que ligar de novo. FUNCOES SEMPRE EMBAIXO DO DID LOAD
    @IBAction func resposta1ButtonAction(_ sender: Any) {
        checarResposta(resposta: resposta1Button.currentTitle!)
        gerarPerguntaAleatoria()
        gerarRespostaAleatoria()
    }
    
    @IBAction func resposta2ButtonAction(_ sender: Any) {
        checarResposta(resposta: resposta2Button.currentTitle!)
        gerarPerguntaAleatoria()
        gerarRespostaAleatoria()
    }
    
    @IBAction func resposta3ButtonAction(_ sender: Any) {
        checarResposta(resposta: resposta3Button.currentTitle!)
        gerarPerguntaAleatoria()
        gerarRespostaAleatoria()
    }
    
    @IBAction func resposta4ButtonAction(_ sender: Any) {
        checarResposta(resposta: resposta4Button.currentTitle!)
        gerarPerguntaAleatoria()
        gerarRespostaAleatoria()
    }
    
    //ALTERAR IMAGEM BRUNO ENSINOU <3
    func gerarPerguntaAleatoria() {
        let number = Int.random(in: 0..<perguntas.count-1)
        caractereImageView.image = UIImage(named: perguntas[number])
        perguntaAtual = perguntas[number]
    }
    
    func gerarRespostaAleatoria() {
        var copiaPerguntas = perguntas.map{$0} //cria um vetor novo alteravel do perguntas pra poder modificar sem estragar
        var perguntasButton : [String] = []
        
        for _ in 0..<3 {
            let pergunta = copiaPerguntas[gerarNumerosAleatorios(copiaPerguntas.count)]
            perguntasButton.append(pergunta)
            for elements in copiaPerguntas {
                if elements == pergunta {
                    copiaPerguntas.removeAll(where: {$0 == pergunta})
                    //{elements in } thiago que ensinou
                }
            }
        }
        
        //aqui aonde crashou - shuffle vetor
        print(perguntasButton.count)
        perguntasButton.append(perguntaAtual)
        
        perguntasButton.shuffle()
        var nomeBotao = perguntasButton.first
        resposta1Button.setTitle(nomeBotao, for: .normal)
        perguntasButton.removeFirst()
        
        perguntasButton.shuffle()
        nomeBotao = perguntasButton.first
        resposta2Button.setTitle(nomeBotao, for: .normal)
        perguntasButton.removeFirst()
        
        perguntasButton.shuffle()
        nomeBotao = perguntasButton.first
        resposta3Button.setTitle(nomeBotao, for: .normal)
        perguntasButton.removeFirst()
        
        perguntasButton.shuffle()
        nomeBotao = perguntasButton.first
        resposta4Button.setTitle(nomeBotao, for: .normal)
        perguntasButton.removeFirst()
        
//       nomeBotao = perguntasButton[gerarNumerosAleatorios(perguntasButton.count)]
//        resposta2Button.setTitle(nomeBotao, for: .normal)
//        perguntasButton.removeAll(where: {$0 == nomeBotao}) //pastre
//
//        nomeBotao = perguntasButton.first!
//        resposta3Button.setTitle(nomeBotao, for: .normal)
//        perguntasButton.removeFirst()
//
//        nomeBotao = perguntasButton.first!
//        resposta4Button.setTitle(nomeBotao, for: .normal)
        
    }
    
    
    //bruno sofre pra me ajudar
    func gerarNumerosAleatorios(_ limitador : Int) -> Int {
        let number = Int.random(in: 0..<(limitador - 1)) //SEMPRE COLOCA O MENOS 1
        return number
    }
    func checarResposta(resposta : String) {
        if perguntaAtual == resposta {
            print("Acertou")
        } else {
            print("Errou")
        }
    }
    
}
