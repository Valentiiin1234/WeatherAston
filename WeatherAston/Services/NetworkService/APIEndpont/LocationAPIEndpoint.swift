//
//  LocationAPIEndpoint.swift
//  WeatherAston
//
//  Created by Mac on 27.11.2023.
//

import Foundation


struct LocationAPIEndPoint: APIEndpoint {
    var path = "/data/2.5/weather"
    
    var method = "GET"
    
    
    var parameters: [String : String]
    init(lat: String, lon: String) {
        parameters = [
            "lat": "\(lat)",
            "lon": "\(lon)"
        ]
    }
    
    
}
