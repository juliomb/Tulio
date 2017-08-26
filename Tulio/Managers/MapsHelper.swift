//
//  MapsHelper.swift
//  Tulio
//
//  Created by Julio Martinez on 24/08/2017.
//  Copyright © 2017 Julio Martinez. All rights reserved.
//

import Foundation
import MapKit

class MapsHelper {
    
    private static let defaultRegionDistance: CLLocationDistance = 5000
    private static let baseMapsURLComponents = URLComponents(string: "http://maps.apple.com")!
    
    static func openMaps(withLocation location: String){
        
        // we try to use geocoder, if not placemarks found, we simply add the maps url with the location query
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location) { (placemarks, error) in
            
            if let clPlacemark = placemarks?.first, let coordinate = clPlacemark.location?.coordinate, let dictionary = clPlacemark.addressDictionary as? [String: Any] {
                let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: dictionary)
                let regionSpan = MKCoordinateRegionMakeWithDistance(placemark.coordinate, defaultRegionDistance, defaultRegionDistance)
                let options = [
                    MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                    MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
                ]
                let mapItem = MKMapItem(placemark: placemark)
                mapItem.name = location
                mapItem.openInMaps(launchOptions: options)
                
            } else {
                
                var components = baseMapsURLComponents
                components.queryItems = [URLQueryItem(name: "address", value: location)]
                print(components.url!)
                UIApplication.shared.open(components.url!, options: [:], completionHandler: nil)
                
            }
        }
        
    }
    
}

