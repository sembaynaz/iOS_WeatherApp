//
//  ForecastCollectionViewCell.swift
//  WheaterApp
//
//  Created by Nazerke Sembay on 28.09.2023.
//

import UIKit
import SnapKit

class ForecastCollectionViewCell: UICollectionViewCell {
    static let identifier = "ForecastCollectionViewCell"
    
    let weekLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Montserrat-Regular", size: 10)
        label.text = "Sunday"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let borderView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(
            red: 212/255,
            green: 212/255,
            blue: 212/255,
            alpha: 1
        ).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let weatherImageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let temperatureLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Montserrat-Light", size: 12)
        label.text = "10° C"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func configure(forecast: Forecast) {
        weekLabel.text = forecast.date
        weatherImageView.image = UIImage(named: forecast.image)
        temperatureLabel.text = forecast.temp
        setupUI()
    }
    
    
    func setupUI() {
        addSubview(weekLabel)
        addSubview(borderView)
        borderView.addSubview(weatherImageView)
        borderView.addSubview(temperatureLabel)
        
        temperatureLabel.snp.makeConstraints { make in
            make.centerX.equalTo(borderView.snp.centerX)
            make.top.equalTo(weatherImageView.snp.bottom).offset(6)
        }
        
        weatherImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.centerX.equalTo(borderView.snp.centerX)
            make.height.width.equalTo(26)
        }
        
        borderView.snp.makeConstraints { make in
            make.top.equalTo(weekLabel.snp.bottom).offset(6)
            make.left.right.bottom.equalToSuperview()
            make.width.equalTo(70)
            make.height.equalTo(75)
        }
        
        weekLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
        }
    }
}
