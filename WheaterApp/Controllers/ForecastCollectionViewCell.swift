//
//  ForecastCollectionViewCell.swift
//  WheaterApp
//
//  Created by Nazerke Sembay on 28.09.2023.
//

import UIKit
import SnapKit
import SDWebImage

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
        image.contentMode = .scaleToFill
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
        weatherImageView.sd_setImage(with: URL(string:  "https://openweathermap.org/img/wn/\(forecast.image).png"))
        
        var date = forecast.date
        if !date.isEmpty {
            if let indexOfSpace = date.firstIndex(of: " ") {
                date = String(date.prefix(upTo: indexOfSpace))
            }
            date = date.trimmingCharacters(in: .whitespaces)
            weekLabel.text = setDateFormat(date: date)
        }
        temperatureLabel.text = forecast.temp + " °C"
        setupUI()
    }
    
    func setDateFormat(date: String)  -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: date) {
            let calendar = Calendar.current
            let dayOfWeek = calendar.component(.weekday, from: date)
            let weekdays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
            let dayName = weekdays[dayOfWeek - 1]
            return dayName
        } else {
            return "Invalid date format"
        }
    }
    
    func setupUI() {
        addSubview(weekLabel)
        addSubview(borderView)
        borderView.addSubview(weatherImageView)
        borderView.addSubview(temperatureLabel)
        
        temperatureLabel.snp.makeConstraints { make in
            make.centerX.equalTo(borderView.snp.centerX)
            make.bottom.equalToSuperview().offset(-15)
        }
        
        weatherImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalTo(borderView.snp.centerX)
            make.height.width.equalTo(50)
        }
        
        borderView.snp.makeConstraints { make in
            make.top.equalTo(weekLabel.snp.bottom).offset(6)
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(75)
        }
        
        weekLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalTo(snp.centerX)
        }
    }
}
