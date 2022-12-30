//
//  MapViewModel.swift
//  Khalo
//
//  Created by Furqan on 28/12/2022.
//

import Foundation
import CoreLocation
import MapKit
class LocationManager: NSObject, ObservableObject , CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    @Published var region = MKCoordinateRegion()
    @Published var placemark: CLPlacemark?
    @Published var location: CLLocation?
    private let geocoder = CLGeocoder()
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest   // for accuracy of location
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
      
        locationManager.delegate = self
    }
   
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        placemark = nil
        locations.last.map
        {
           
            region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            self.location = $0
        }
       // let _ = print("Data \(String(describing: self.location?.coordinate.latitude))")
        self.geocode()
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("ERROR IS GETTING LOCATION \(error)")
    }
    
    private func geocode() {
        guard let location = self.location else { return }
       geocoder.reverseGeocodeLocation(location, completionHandler: { (places, error) in
         if error == nil {
             self.placemark = places?.last
         } else {
           self.placemark = nil
         }
       })
     }
}



