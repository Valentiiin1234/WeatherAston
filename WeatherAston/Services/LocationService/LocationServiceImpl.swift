//
//  LocationService.swift
//  WeatherAston
//
//  Created by Mac on 18.11.2023.
//

import Foundation
import CoreLocation

class LocationServiceImpl: NSObject, CLLocationManagerDelegate, LocationService {
    
    private var locationManager = CLLocationManager()
    
    private var completion: ((Result<CLLocation,LocationError>) -> Void)?

    override init() {
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
    }
    
    
    func detectLocation(_ compelition: @escaping (Result<CLLocation, LocationError>) -> Void) {
        self.completion = compelition
        processAuthorization(status: locationManager.authorizationStatus)
    }

    private func processAuthorization(status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            
        case .restricted, .denied:
            completion?(.failure(.notAuthorized))
            break
        @unknown default:
            completion?(.failure(.noLocation))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        processAuthorization(status: status)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            completion?(.success(location))
            
        } else {
            completion?(.failure(.noLocation))
        }
        locationManager.stopUpdatingLocation()
    }
}

