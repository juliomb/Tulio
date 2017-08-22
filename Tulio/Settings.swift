//
//  Settings.swift
//  Tulio
//
//  Created by Julio Martinez on 21/08/2017.
//  Copyright © 2017 Julio Martinez. All rights reserved.
//

import Foundation

struct Settings {
    
    static let apiKey = "br3d8vqbgaunz4m5sfsz89c2"
    
    // MARK: Search dates
    
    static var initialFromDate: Date {
        var date = Date()
        date = date.addingTimeInterval(TimeInterval(60*60*24)) // adding one day
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(bySettingHour: 10, minute: 0, second: 0, of: date)! // 10 am of tomorrow
    }
    static var minimumFromDate: Date {
        var timeInterval = Date().timeIntervalSince1970
        timeInterval = ceil(timeInterval/(60*60))
        timeInterval *= 60*60 // truncating minutes
        return Date(timeIntervalSince1970: timeInterval)
    }
    static let minimumRentInterval = TimeInterval(60*60) // one hour
    static let defaultRentInterval = TimeInterval(60*60*24*7) // one week

    
}
