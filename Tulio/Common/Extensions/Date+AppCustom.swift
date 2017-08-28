//
//  Date+AppCustom.swift
//  Tulio
//
//  Created by Julio Martinez on 26/08/2017.
//  Copyright © 2017 Julio Martinez. All rights reserved.
//

import Foundation

extension Date {
    
    static var tomorrowMorning: Date {
        var date = self.init()
        date = date.addingTimeInterval(TimeInterval(60*60*24)) // adding one day
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(bySettingHour: 10, minute: 0, second: 0, of: date)! // 10 am of tomorrow
    }
    
    static var currentRoundHour: Date {
        var timeInterval = self.init().timeIntervalSince1970
        timeInterval = ceil(timeInterval/(60*60))
        timeInterval *= 60*60 // truncating minutes
        return self.init(timeIntervalSince1970: timeInterval)
    }
    
}
