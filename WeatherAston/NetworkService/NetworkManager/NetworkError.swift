//
//  NetworkError.swift
//  WeatherAston
//
//  Created by Mac on 13.11.2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}
