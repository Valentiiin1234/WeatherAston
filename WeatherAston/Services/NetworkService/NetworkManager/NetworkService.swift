//
//  NetworkService.swift
//  WeatherAston
//
//  Created by Mac on 06.12.2023.
//

import Foundation

protocol NetworkService {
    func fetch<T: Decodable>(_ type: T.Type, from endpoint: APIEndpoint, completion: @escaping(Result<T, NetworkError>) -> Void)
}
