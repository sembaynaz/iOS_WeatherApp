//
//  MainViewController.swift
//  WheaterApp
//
//  Created by Nazerke Sembay on 24.09.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    private static let id = "&appid=82aa1dd27f2bfb3f068c8bdd58442661"
    var weatherArray: [Forecast] = [Forecast(cityName: "qwe", temp: "12", pressure: "123", humadity: "123", visibility: "123", windSpeed: "123", date: "123", image: "")]
    //MARK: Elements
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
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(
            UIImage(named: "search"),
            for: .normal
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let dateLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Montserrat-Regular", size: 14)
        label.text = "Today, May 7th, 2021"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Bold", size: 40)
        label.text = "Barcelona"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let countryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Regular", size: 20)
        label.text = "Spain"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let circleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 240 / 2
        let shadowColor = UIColor.red
//        UIColor(
//            red: 96/255,
//            green: 209/255,
//            blue: 234/255,
//            alpha: 0.4
//        )
        view.layer.shadowColor = shadowColor.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 28)
        view.layer.shadowRadius = 36
        view.layer.shadowOpacity = 0.4
        view.layer.masksToBounds = false
        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stackVerticalLabel: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let stackVerticalLabel2: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let stackVerticalLabel3: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let stackVerticalLabel4: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    let windLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.text = "Wind status"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let humidityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.text = "Humidity"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let visibilityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.text = "Visibility"
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let airLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.text = "Air pressure"
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let windLabelResult: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Regular", size: 20)
        label.text = "7 mph"
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let humidityLabelResult: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Regular", size: 20)
        label.text = "85%"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let visibilityLabelResult: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Regular", size: 20)
        label.text = "6.4 miles"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let airLabelResult: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Regular", size: 20)
        label.text = "998 mb"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let collectionBGView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 60
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let collectionTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.text = "The Next 5 days"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.register(
            ForecastCollectionViewCell.self,
            forCellWithReuseIdentifier: ForecastCollectionViewCell.identifier
        )
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
//MARK: Constraints
extension MainViewController {
    func configureUI() {
        view.addSubview(backgroundView)
        view.addSubview(searchButton)
        view.addSubview(dateLabel)
        view.addSubview(cityLabel)
        view.addSubview(countryLabel)
        view.addSubview(circleView)
        
        view.addSubview(stackVerticalLabel)
        stackVerticalLabel.addArrangedSubview(windLabel)
        stackVerticalLabel.addArrangedSubview(windLabelResult)
        
        view.addSubview(stackVerticalLabel2)
        stackVerticalLabel2.addArrangedSubview(humidityLabel)
        stackVerticalLabel2.addArrangedSubview(humidityLabelResult)
        
        view.addSubview(stackVerticalLabel3)
        stackVerticalLabel3.addArrangedSubview(visibilityLabel)
        stackVerticalLabel3.addArrangedSubview(visibilityLabelResult)
        
        view.addSubview(stackVerticalLabel4)
        stackVerticalLabel4.addArrangedSubview(airLabel)
        stackVerticalLabel4.addArrangedSubview(airLabelResult)
        
        view.addSubview(collectionBGView)
        collectionBGView.addSubview(collectionTitleLabel)
        collectionBGView.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(collectionTitleLabel.snp.top).offset(16)
            make.right.left.equalToSuperview().offset(15)
        }
        
        collectionTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(25)
            make.left.equalTo(15)
        }
        
        collectionBGView.snp.makeConstraints { make in
            make.bottom.right.left.equalToSuperview()
            make.top.equalTo(humidityLabelResult.snp.bottom).offset(30)
        }
        
        stackVerticalLabel4.snp.makeConstraints { make in
            make.top.equalTo(stackVerticalLabel3.snp.bottom).offset(20)
            make.right.equalTo(-57)
            make.width.equalTo(90)
        }
        
        stackVerticalLabel3.snp.makeConstraints { make in
            make.top.equalTo(circleView.snp.bottom).offset(31)
            make.right.equalTo(-57)
            make.width.equalTo(90)
        }
        
        stackVerticalLabel2.snp.makeConstraints { make in
            make.top.equalTo(stackVerticalLabel.snp.bottom).offset(20)
            make.left.equalTo(57)
            make.width.equalTo(90)
        }
        
        stackVerticalLabel.snp.makeConstraints { make in
            make.top.equalTo(circleView.snp.bottom).offset(31)
            make.left.equalTo(57)
            make.width.equalTo(90)
        }
        
        backgroundView.snp.makeConstraints { make in
            make.bottom.top.right.left.equalToSuperview()
        }
        
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.right.equalTo(-25)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(55)
            make.centerX.equalTo(view.snp.centerX)
        }
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom)
            make.centerX.equalTo(view.snp.centerX)
        }
        countryLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom)
            make.centerX.equalTo(view.snp.centerX)
        }
        circleView.snp.makeConstraints { make in
            make.top.equalTo(countryLabel.snp.bottom).offset(18)
            make.height.width.equalTo(240)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ForecastCollectionViewCell.identifier,
            for: indexPath) as! ForecastCollectionViewCell
        cell.configure(forecast: weatherArray[indexPath.row])
        
        return cell
    }
    
    
}
