//
//  LocationService.swift
//  WeatherAston
//
//  Created by Mac on 05.12.2023.
//
import CoreLocation
import Foundation


enum LocationError: Error {
    
    case notAuthorized
    case noLocation
}
protocol LocationService {
    func detectLocation(_ compelition: @escaping (Result<CLLocation, LocationError>) -> Void)
}
