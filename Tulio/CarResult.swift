//
//  CarResult.swift
//  Tulio
//
//  Created by Julio Martinez on 22/08/2017.
//  Copyright © 2017 Julio Martinez. All rights reserved.
//

import Foundation

struct CarResult {
    
    let carTypeCode: String
    let currencyCode: String
    let rentalDays: String
    let totalPrice: String
    var location: String {
        get {
            if let airport = pickupAirport {
                return "\(airport) Airport"
            } else if vendorLocation != nil {
                return vendorLocation!
            }
            return locationDescription
        }
    }
    var currency: String {
        get {
            switch currencyCode {
            case "USD":
                return "$"
            case "EUR":
                return "€"
            case "POU":
                return "£"
            default:
                return "$"
            }
        }
    }

    let pickupAirport: String?
    let vendorLocation: String?
    let locationDescription: String
    let deepLink: URL?
    let subTotal: String
    let dailyRate: String
    let taxesAndFees: String
    let pickupDay: String
    let pickupTime: String
    let dropoffDay: String
    let dropoffTime: String
    
    
    init?(json: Dictionary<String, Any>) {
        guard let carTypeCode = json["CarTypeCode"] as? String,
            let currencyCode = json["CurrencyCode"] as? String,
            let rentalDays = json["RentalDays"] as? String,
            let totalPrice = json["TotalPrice"] as? String,
            let locationDescription = json["LocationDescription"] as? String,
            let deepLinkString = json["DeepLink"] as? String,
            let deepLink = URL(string: deepLinkString),
            let subTotal = json["SubTotal"] as? String,
            let dailyRate = json["DailyRate"] as? String,
            let taxesAndFees = json["TaxesAndFees"] as? String,
            let pickupDay = json["PickupDay"] as? String,
            let pickupTime = json["PickupTime"] as? String,
            let dropoffDay = json["DropoffDay"] as? String,
            let dropoffTime = json["DropoffTime"] as? String else {
                print("Error, invalid json to build a CarResult: \(json)")
                return nil
        }
        
        self.carTypeCode = carTypeCode
        self.currencyCode = currencyCode
        self.rentalDays = rentalDays
        self.totalPrice = totalPrice
        self.locationDescription = locationDescription
        self.deepLink = deepLink
        self.subTotal = subTotal
        self.dailyRate = dailyRate
        self.taxesAndFees = taxesAndFees
        self.pickupDay = pickupDay
        self.pickupTime = pickupTime
        self.dropoffDay = dropoffDay
        self.dropoffTime = dropoffTime
        
        if let airport = json["PickupAirport"] as? String {
            self.pickupAirport = airport
        } else {
            self.pickupAirport = nil
        }
        
        if let vendor = json["VendorLocation"] as? String {
            self.vendorLocation = vendor
        }else {
            self.vendorLocation = nil
        }
        
    }
    
    
    
}
