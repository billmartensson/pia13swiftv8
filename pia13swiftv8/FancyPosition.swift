//
//  FancyPosition.swift
//  pia13swiftv8
//
//  Created by BillU on 2024-12-23.
//

import Foundation
import CoreLocation

@Observable class FancyPosition: NSObject, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    
    var userLocation: CLLocation?
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func fancyGetPosition() {
        locationManager.requestLocation()
        //locationManager.startUpdatingLocation()
    }
    
    func fancyGetAuth() {
        locationManager.requestAlwaysAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first {
            print("Found user's location: \(location)")
            
            userLocation = location
        }
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Failed to find user's location: \(error)")
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print("AUTH DID CHANGE")
    }
    
}
