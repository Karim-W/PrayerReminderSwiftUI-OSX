//
//  LocationManager.swift
//  Prayer
//
//  Created by Karim Hassan on 17/12/2021.
//

import Foundation
import SwiftUI
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    
    // static let shared = LocationManager()
    // override init(){
    //     self.Long = 0.0
    //     self.Lat = 0.0
    // }

    // private let locationManager = CLLocationManager()
    // private var location: CLLocation?
    // private var timer: Timer?
    // private var isUpdating = false
    // private var Lat:Double
    // private var Long:Double
    
    // func startUpdating(){
    //     if isUpdating{
    //         return
    //     }
    //     isUpdating = true
    //     locationManager.delegate = self
    //     locationManager.desiredAccuracy = kCLLocationAccuracyBest
    //     locationManager.requestWhenInUseAuthorization()
    //     locationManager.startUpdatingLocation()
    //     timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: {_ in
    //         self.locationManager.requestLocation()
    //     })
    // }
    
    // func stopUpdating(){
    //     if !isUpdating{
    //         return
    //     }
    //     isUpdating = false
    //     locationManager.stopUpdatingLocation()
    //     timer?.invalidate()
    // }
    
    // func getLocation() -> CLLocation?{
    //     return location
    // }
    // func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    //     if let location = locations.first {
    //         print("Location data received.")
    //         print(location)
    //         print("LAT LONG")
    //         self.Lat = location.coordinate.latitude
    //         self.Long = location.coordinate.longitude
    //         print(location.coordinate.latitude)
    //     }
    // }
    // func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    //     print("Failed to get users location.")
    // }
    // func getLongLatApiString()->String{
    //     return "latitude=" + String(self.Lat) + "&longitude=" + String(self.Long)
    // }
    private let LocationManager = CLLocationManager()
    @Published var location: CLLocation? = nil
    override init () {
        super.init()
        LocationManager.delegate = self
        LocationManager.desiredAccuracy = kCLLocationAccuracyBest
        LocationManager.requestWhenInUseAuthorization()
        LocationManager.startUpdatingLocation()
    }


}

extension LocationManager:CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location

    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get users location.")
    }
    
    func getLongLatApiString()->String{
        return "latitude=" + String(self.location?.coordinate.latitude ?? 0.0) + "&longitude=" + String(self.location?.coordinate.longitude ?? 0.0)
     }
    
}
