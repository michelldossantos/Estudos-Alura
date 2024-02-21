//
//  ViewController.swift
//  ProjetoAluraUiKIT
//
//  Created by Michel Santos on 20/02/24.
//
import UIKit
import SnapKit

protocol LoadViewController{
    func makeConstrants()
    func setupLayout()
}

class TestViewController: UIViewController, LoadViewController {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "Logo")
        return imageView
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .init(named: "BackgraundButton")
        button.layer.cornerRadius = 16
        button.setTitle("Iniciar Quiz", for: .normal)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(named: "Backgraund00")
        setupLayout()
        makeConstrants()
    }
    
    func makeConstrants() {
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(104)
            make.width.equalTo(216)
            make.top.equalToSuperview().offset(250)
        }
        
        button.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(62)
            make.top.equalTo(imageView.snp.bottom).offset(42)
        }
    }
    
    func setupLayout() {
        view.addSubview(imageView)
        view.addSubview(button)
    }
}

