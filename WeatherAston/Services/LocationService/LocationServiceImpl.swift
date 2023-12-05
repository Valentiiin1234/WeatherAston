//
//  LocationService.swift
//  WeatherAston
//
//  Created by Mac on 18.11.2023.
//

import Foundation
import CoreLocation

class LocationServiceImpl: NSObject, CLLocationManagerDelegate, LocationService {
    
    private var locationManager: CLLocationManager!
    
    private var completion: ((_ isGranted: Bool) -> Void)?
    
    private(set) var location: CLLocation?

    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
    }
    
    func requestAccess(_ completion: @escaping (_ isGranted: Bool) -> Void){
        self.completion = completion
        processAuthorization(status: locationManager.authorizationStatus)
    }
    
    private func processAuthorization(status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            completion?(true)
        case .restricted, .denied:
            completion?(false)
            break
        @unknown default:
            completion?(false)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        processAuthorization(status: status)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.location = locations.first
    }
}

