//
//  MainViewController.swift
//  WheaterApp
//
//  Created by Nazerke Sembay on 24.09.2023.
//

import UIKit
import SnapKit
import SwiftyJSON
import Alamofire
import SVProgressHUD
import SDWebImage

class MainViewController: UIViewController {
    private static let id = "&appid=82aa1dd27f2bfb3f068c8bdd58442661"
    
    var fiveForecast: [String] = []
    
    var weatherArray: [Weather] = []
    
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
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: 70, height: 93)
        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.register(
            ForecastCollectionViewCell.self,
            forCellWithReuseIdentifier: ForecastCollectionViewCell.identifier
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let weatherImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "10d")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Light", size: 70)
        label.text = "°C"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        collectionView.delegate = self
        collectionView.dataSource = self
        loadData()
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
        circleView.addSubview(weatherImageView)
        circleView.addSubview(temperatureLabel)
        
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
        
        weatherImageView.snp.makeConstraints { make in
            make.centerX.equalTo(circleView.snp.centerX)
            make.top.equalTo(-5)
            make.height.width.equalTo(120)
        }
        temperatureLabel.snp.makeConstraints { make in
            make.centerX.equalTo(circleView.snp.centerX)
            make.bottom.equalTo(circleView.snp.bottom).offset(-49)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(collectionTitleLabel.snp.bottom).offset(16)
            make.right.equalToSuperview().offset(-15)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(93)
        }
        collectionTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(35)
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

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ForecastCollectionViewCell.identifier,
            for: indexPath) as! ForecastCollectionViewCell
        var filteredForecasts: [Forecast] = []
        
        for weather in weatherArray {
            let midnightForecasts = weather.forecastArray.filter { $0.date.hasSuffix("00:00:00") }
            filteredForecasts.append(contentsOf: midnightForecasts)
        }
        
        print(filteredForecasts)
        
        if indexPath.row < filteredForecasts.count {
            let forecast = filteredForecasts[indexPath.row]
            cell.configure(forecast: forecast)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let totalSpacing = 4 * 10
        let itemWidth = (collectionViewWidth - CGFloat(totalSpacing)) / 5
        return CGSize(width: itemWidth, height: 93)
    }
}

extension MainViewController {
    func loadData() {
        SVProgressHUD.show()
        
        AF.request("http://api.openweathermap.org/data/2.5/forecast?q=Almaty" + MainViewController.id, method: .get).responseJSON { response in
            
            SVProgressHUD.dismiss()
            
            if response.response?.statusCode == 200 {
                let json = JSON(response.data!)
                let weather = Weather(json: json)
                self.weatherArray.append(weather)
                self.setResults()
                self.collectionView.reloadData()
            } else {
                SVProgressHUD.showError(withStatus: "CONNECTION_ERROR")
            }
        }
    }
    
    func setResults() {
        if let firstWeather = weatherArray.first, let firstForecast = firstWeather.forecastArray.first {
            temperatureLabel.text = firstForecast.temp + "°C"
            weatherImageView.sd_setImage(with: URL(string:  "https://openweathermap.org/img/wn/\(firstForecast.image)@2x.png"))
            windLabelResult.text = firstForecast.windSpeed
            humidityLabelResult.text = firstForecast.humidity
            visibilityLabelResult.text = firstForecast.visibility
            airLabelResult.text = firstForecast.pressure
            
            var date = firstForecast.date
            if !date.isEmpty {
                if let indexOfSpace = date.firstIndex(of: " ") {
                    date = String(date.prefix(upTo: indexOfSpace))
                }
                date = date.trimmingCharacters(in: .whitespaces)
                dateLabel.text = setFormattedDate(date: date)
            }

        }
        cityLabel.text = weatherArray.first?.cityName
        countryLabel.text = weatherArray.first?.countryName
    }
    
    func setFormattedDate(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: date) {
            let calendar = Calendar.current
            let day = calendar.component(.day, from: date)
            let monthNumber = calendar.component(.month, from: date)
            var month = ""
            switch monthNumber {
            case 1: month = "January"
            case 2: month = "February"
            case 3: month = "March"
            case 4: month = "April"
            case 5: month = "May"
            case 6: month = "June"
            case 7: month = "July"
            case 8: month = "August"
            case 9: month = "September"
            case 10: month = "October"
            case 11: month = "November"
            default: month = "December"
            }
            let year = calendar.component(.year, from: date)
            let dayCurrent = "Today, \(month) \(day)th, \(year)"
            return dayCurrent
        } else {
            return "Invalid date format"
        }
    }
}
