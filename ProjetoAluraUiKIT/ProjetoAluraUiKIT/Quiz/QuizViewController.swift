//
//  QuizViewController.swift
//  ProjetoAluraUiKIT
//
//  Created by Michel Santos on 21/02/24.
//

import Foundation
import UIKit
import SnapKit

enum QuizButtonType: Int {
    case optionOne = 1
    case optionTwo = 2
    case optionThree = 3
}


class QuizViewController: UIViewController, LoadViewController {
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.text = "Teste de Label"
        label.font = UIFont.systemFont(ofSize: 32)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var questionOnebutton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .init(named: "BackgraundButton")
        button.layer.cornerRadius = 16
        button.setTitle("Option One", for: .normal)
        button.addTarget(self, action: #selector(botaoPressionado), for: .touchUpInside)
        button.tag = QuizButtonType.optionOne.rawValue
        
        return button
    }()
    
    lazy var questionTwobutton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .init(named: "BackgraundButton")
        button.layer.cornerRadius = 16
        button.setTitle("Option Two", for: .normal)
        button.addTarget(self, action: #selector(botaoPressionado), for: .touchUpInside)
        button.tag = QuizButtonType.optionTwo.rawValue
        
        return button
    }()
    
    lazy var questionThreebutton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .init(named: "BackgraundButton")
        button.layer.cornerRadius = 16
        button.setTitle("Option Three", for: .normal)
        button.addTarget(self, action: #selector(botaoPressionado), for: .touchUpInside)
        button.tag = QuizButtonType.optionThree.rawValue
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(named: "Backgraund00")
        setupLayout()
        makeConstrants()
    }
    
    func makeConstrants() {
        questionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(135)
            make.leading.trailing.equalToSuperview().inset(54)
            
        }
        
        questionOnebutton.snp.makeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom).offset(72)
            make.leading.trailing.equalToSuperview().inset(64)
            make.height.equalTo(62)
            make.centerX.equalToSuperview()
            
        }
        
            questionTwobutton.snp.makeConstraints { make in
            make.top.equalTo(questionOnebutton.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(64)
            make.height.equalTo(62)
            make.centerX.equalToSuperview()
            
        }
        
        questionThreebutton.snp.makeConstraints { make in
            make.top.equalTo(questionTwobutton.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(64)
            make.height.equalTo(62)
            make.centerX.equalToSuperview()
        }
    }
    
    func setupLayout() {
        view.addSubview(questionLabel)
        view.addSubview(questionOnebutton)
        view.addSubview(questionTwobutton)
        view.addSubview(questionThreebutton)
    }
}

@objc
private extension QuizViewController {
    @objc func botaoPressionado(sender: UIButton) {
        let tagDoBotao = sender.tag
        print("The button with tag \(tagDoBotao) was pressed.")
    }
}

