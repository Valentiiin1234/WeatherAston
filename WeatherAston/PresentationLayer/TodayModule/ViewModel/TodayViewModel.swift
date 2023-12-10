//
//  TodayViewModel.swift
//  WeatherAston
//
//  Created by Mac on 03.11.2023.
//

import Foundation

final class TodayViewModel: TodayViewOutput {
    
    private let locationService: LocationService
    private let storageService: StorageService
    private let networkService: NetworkService
    private var weather: [Weather] = []
    private var description = ""
    
    private var entity: [EntityCity] = []
    
    weak var view: TodayViewInput?
    
    init(
        locationService: LocationService,
        storageService: StorageService,
        networkService: NetworkService
    ){
        self.locationService = locationService
        self.storageService = storageService
        self.networkService = networkService
    }
    
    func searchCity(city: String) {
        let endpoint = CityAPIEndpoint(city: city)
        self.queryCity(for: endpoint)
    }
    
    func getCurrentLocation() {
        
        locationService.detectLocation { [weak self] result in
            switch result {
                
            case .success(let location):
                let lat = "\(location.coordinate.latitude)"
                let lon = "\(location.coordinate.longitude)"
                let endpoint = LocationAPIEndPoint(lat: lat, lon: lon)
                self?.queryCity(for: endpoint)
            case .failure(let error):
                
                switch error {
                    
                case .notAuthorized:
                    let endpoint = CityAPIEndpoint(city: "Moscow")
                    self?.queryCity(for: endpoint)
                case .noLocation:
                    self?.view?.showError()
                }
            }
        }
    }
}

private extension TodayViewModel{
    
    func queryCity(for city: APIEndpoint) {
        view?.loading()
        networkService.fetch(City.self, from: city) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.weather = data.weather
                    self?.weather.forEach({ result in
                        self?.description =  result.description
                    })
                    let wind = WeatherParameterViewModel(parameter: "wind", title: "\(Int(data.wind.speed)) m/s")
                    let clouds = WeatherParameterViewModel(parameter: "clouds", title: "\(data.clouds.all) %")
                    let humdity = WeatherParameterViewModel(parameter: "humdity", title: "\(Int(data.main.humidity)) %")
                    let description = self?.description ?? "no description"
                    let city = LocationViewParamViewModel(cityName: data.name)
                    let tempCurrent = ElementTempViewModel(textLabel: "TEMP NOW", tempValue: "\(Int(data.main.temp - 273)) ℃")
                    let maxTemp = ElementTempViewModel(textLabel: "TEMP MAX", tempValue: "\(Int(data.main.tempMax - 273)) ℃")
                    let minTemp = ElementTempViewModel(textLabel: "TEMP MIN", tempValue: "\(Int(data.main.tempMin - 273)) ℃")
                    let forecast = ForecastViewModel(city: city,
                                                     wind: wind,
                                                     clouds: clouds,
                                                     labelHumidity: humdity,
                                                     description: description,
                                                     currenrTemp: tempCurrent,
                                                     tempMax: maxTemp,
                                                     tempMin: minTemp)
                    self?.view?.showForecast(with: forecast)
                    let cityName = "\(city.cityName)"
                    self?.storageService.createData(cityName)
                case .failure(let error):
                  print(error)  
                }
            }
        }
    }
}


