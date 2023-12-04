//
//  LocationService.swift
//  WeatherAston
//
//  Created by Mac on 18.11.2023.
//

import Foundation
import CoreLocation


class LocationService: NSObject, CLLocationManagerDelegate {
    
    private var locationManager: CLLocationManager!
    
    var location: CLLocation? {
        return locationManager.location
    }
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager.delegate = self
    }
    
    private func processAuthorization(status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        case .restricted, .denied: break
            
        @unknown default:
            fatalError()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        processAuthorization(status: status)
    }
}

