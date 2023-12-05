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
    private var city: City?
    private var weather: [Weather] = []
    private var description = ""
    
    private var entity: [EntityCity] = []
    
    weak var view: TodayViewInput?
    
    init(locationService: LocationService, storageService: StorageService){

        self.locationService = locationService
        self.storageService = storageService
    }
    
    func getCurrentLocation() {
//        locationService.requestAccess { isGranted in
//            switch isGranted {
//                
//            case true:
//                <#code#>
//            case false:
//                <#code#>
//            }
//        }
       
    }
    
    func searchCity(for city: String) {
        let endpoint = CityAPIEndpoint(city: "\(city)")
        queryCity(for: endpoint)
#warning("delete")
        storageService.createData(city)
    }
}

extension TodayViewModel{
    func queryCity(for city: APIEndpoint) {
        NetworkService.shared.fetch(City.self, from: city) {[weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.city = data
                    self?.weather = data.weather
                    self?.weather.forEach({ result in
                        self?.description =  result.description
                    })
                    guard let description = self?.description else {return}
                    guard let cityName = self?.city?.name else {return}
                    guard let temp = self?.city?.main.temp else {return}
                    guard let speed = self?.city?.wind.speed else {return}
                    guard let clouds = self?.city?.clouds.all else {return}
                    guard let humidity = self?.city?.main.humidity else {return}
                    self?.view?.displayLabels(city: cityName, temp: String(Int(temp - 273)), speed: String(speed), clouds: String(clouds), humidity: String(humidity), description: description)
                case .failure(let error):
                    print(error)
#warning("city ​​not found, show alert")
                    
                }
            }
        }
    }
}


