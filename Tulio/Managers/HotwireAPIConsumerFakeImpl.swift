//
//  HotwireAPIConsumerFakeImpl.swift
//  Tulio
//
//  Created by Julio Martinez on 23/08/2017.
//  Copyright © 2017 Julio Martinez. All rights reserved.
//

import Foundation


class HotwireAPIConsumerFakeImpl: HotwireAPIConsumable {
    
    let fakeJSON = [
        "CurrencyCode": "USD",
        "DeepLink": "https://www.hotwire.com/car/deeplink-details.jsp?resultId=MjAzNzU1NjM3MTQ6MTU4OTE5MDY3MTg5NA--&useCluster=4&sid=S001&bid=B001&inputId=api-results&actionType=303&useCluster=4",
        "ResultId": "MjAzNzU1NjM3MTQ6MTU4OTE5MDY3MTg5NA--&useCluster=4",
        "HWRefNumber": "3401109204",
        "SubTotal": "434.10",
        "TaxesAndFees": "151.31",
        "TotalPrice": "585.41",
        "CarTypeCode": "FFAR",
        "DailyRate": "54.26",
        "DropoffDay": "07/11/2018",
        "DropoffTime": "13:30",
        "PickupDay": "07/04/2018",
        "PickupTime": "10:00",
        "LocationDescription": "On Airport - Shuttle to Vendor",
        "MileageDescription": "Unlimited",
        "PickupAirport": "LGA",
        "RentalDays": "8",
        "VendorLocationId": "LGALGA"
    ]
    
    func searchCars(withSearchParams searchParams: SearchParams, completion: @escaping ([CarResult]) -> Void, onError: ((Error) -> Void)? = nil) {
        if let fakeCar = CarResult(json: fakeJSON) {
            completion([fakeCar])
        }
    }
    
}
