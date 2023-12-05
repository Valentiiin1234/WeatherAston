//
//  LocationService.swift
//  WeatherAston
//
//  Created by Mac on 05.12.2023.
//
import CoreLocation
import Foundation

protocol LocationService {
    var location: CLLocation? { get }
    func requestAccess(_ completion: @escaping (_ isGranted: Bool) -> Void)
}
