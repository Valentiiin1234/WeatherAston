//
//  APIEndpoint.swift
//  WeatherAston
//
//  Created by Mac on 13.11.2023.
//

import Foundation

protocol APIEndpoint {
    
    var path: String { get }
    var method: String { get }
    var parameters: [String : String] { get }
}
