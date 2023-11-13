//
//  NetworkManager.swift
//  WeatherAston
//
//  Created by Mac on 13.11.2023.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    private let baseURL = "https://api.openweathermap.org"
    private let key = "b987b60e486e52764d12bec4d41e340e"
    
    func fetch<T: Decodable>(_ type: T.Type, from endpoint: APIEndpoint, completion: @escaping(Result<T, NetworkError>) -> Void) {
        
        let params = endpoint.parameters.map { key, value in
            "\(key)=\(value)"
        }
       
        let query = params.joined(separator: "&")
        
        guard let url = URL(string: "\(baseURL)\(endpoint.path)?\(query)&appid=\(key)") else {
            print("\(baseURL)\(endpoint.path)?\(query)&appid=\(key)")
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let type = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(type))
                }
            }catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
