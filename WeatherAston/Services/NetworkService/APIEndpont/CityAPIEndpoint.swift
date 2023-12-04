//
//  CityAPIEndpoint.swift
//  WeatherAston
//
//  Created by Mac on 13.11.2023.
//

import Foundation

struct CityAPIEndpoint: APIEndpoint {
    
    var path = "/data/2.5/weather"
    var method = "GET"
    
    var parameters: [String : String]
    init(city: String) {
        parameters = ["q": "\(city)"]
    } 
}
