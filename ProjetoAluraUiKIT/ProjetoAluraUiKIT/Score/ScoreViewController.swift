//
//  ScoreViewController.swift
//  ProjetoAluraUiKIT
//
//  Created by Michel Santos on 22/02/24.
//

import Foundation
import SnapKit
import UIKit

class ScoreViewController: UIViewController, LoadViewController {
    private var points: Int
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Você Finalizou o IQuiz!"
        label.font = UIFont.systemFont(ofSize: 36)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var percentageLabel: UILabel = {
        let label = UILabel()
        label.text = "Porcentual final: 20%"
        label.font = UIFont.systemFont(ofSize: 26)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var restartButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .init(named: "BackgraundButton")
        button.layer.cornerRadius = 16
        button.setTitle("Reiniciar Quiz", for: .normal)
        button.addTarget(self, action: #selector(botaoPressionado), for: .touchUpInside)
        button.tag = QuizButtonType.optionThree.rawValue
        
        return button
    }()
    
    init(points: Int) {
        self.points = points
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(named: "Backgraund00")
        setupLayout()
        makeConstrants()
    }
    
    func makeConstrants() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(168)
            make.leading.trailing.equalToSuperview().inset(80)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(64)
            make.leading.trailing.equalToSuperview().inset(70)
        }
        
        percentageLabel.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(78)
            make.leading.trailing.equalToSuperview().inset(70)
        }
        
        restartButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(8)
            make.leading.trailing.equalToSuperview().inset(64)
            make.height.equalTo(62)
        }
    }
    
    func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(resultLabel)
        view.addSubview(percentageLabel)
        view.addSubview(restartButton)
        
        let percent = getPercent()
        
        resultLabel.text = "Você Acertou \(points) questões de \(questions.count) questões"
        percentageLabel.text = "Percentual final: \(percent)%"
        
        navigationItem.hidesBackButton = true
    }
}

private extension ScoreViewController {
    func getPercent() -> Double {
        return Double((points * 100) / questions.count)
    }
}

@objc
extension ScoreViewController {
    func botaoPressionado() {
        navigationController?.popToRootViewController(animated: true)
    }
}
