//
//  SearchViewController.swift
//  WheaterApp
//
//  Created by Nazerke Sembay on 29.09.2023.
//

import UIKit
import SnapKit
protocol CityNameProtocol: AnyObject {
    func setCityName(_ cityName: String)
}
class SearchViewController: UIViewController {
    weak var delegate: CityNameProtocol?
    var city = ""
    
    let backgroundView: GradientView = {
        let view = GradientView()
        view.startColor = UIColor(
            red: 48/255,
            green: 162/255,
            blue: 197/255,
            alpha: 1
        )
        view.endColor = UIColor(
            red: 0,
            green: 36/255,
            blue: 47/255,
            alpha: 1
        )
        
        view.startLocation = 0.2
        view.endLocation = 1
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let exitButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(
            UIImage(named: "exit"),
            for: .normal
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(
            UIImage(named: "search"),
            for: .normal
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let searchBGView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 50
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let cityTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter in English country name"
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.height))
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        textField.textColor = .black
        textField.layer.cornerRadius = 23
        textField.layer.masksToBounds = true
        textField.backgroundColor = .white
        textField.backgroundColor = UIColor(
            red: 237/255,
            green: 237/255,
            blue: 237/255,
            alpha: 1
        )
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setConstraints()
    }
    
    func setConstraints() {
        view.addSubview(backgroundView)
        view.addSubview(searchBGView)
        searchBGView.addSubview(exitButton)
        searchBGView.addSubview(cityTextField)
        searchBGView.addSubview(searchButton)
        
        cityTextField.snp.makeConstraints { make in
            make.top.equalTo(70)
            make.centerX.equalTo(searchBGView.snp.centerX)
            make.height.equalTo(44)
            make.left.equalTo(29)
            make.right.equalTo(-29)
        }
        
        backgroundView.snp.makeConstraints { make in
            make.bottom.top.right.left.equalToSuperview()
        }
        
        searchBGView.snp.makeConstraints { make in
            make.height.equalTo(366)
            make.top.equalToSuperview().offset(70)
            make.left.right.equalToSuperview()
        }

        exitButton.snp.makeConstraints { make in
            make.height.width.equalTo(30)
            make.top.equalTo(22)
            make.right.equalTo(-17)
        }
        
        searchButton.snp.makeConstraints { make in
            make.height.width.equalTo(30)
            make.centerY.equalTo(cityTextField.snp.centerY)
            make.right.equalTo(cityTextField.snp.right).offset(-20)
        }
        
        buttonTapped()
    }
    
    func buttonTapped() {
        exitButton.addTarget(
            self,
            action: #selector(exitButtonTouched),
            for: .touchUpInside
        )
        
        searchButton.addTarget(
            self,
            action: #selector(searchButtonTapped),
            for: .touchUpInside
        )
    }
}

extension SearchViewController {
    @objc func exitButtonTouched() {
        dismiss(animated: true)
    }
    @objc func searchButtonTapped() {
        someFunction()
        dismiss(animated: true)
    }
    func someFunction() {
        let cityName = cityTextField.text!
        delegate?.setCityName(cityName)
    }
}
