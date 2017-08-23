//
//  Settings.swift
//  Tulio
//
//  Created by Julio Martinez on 21/08/2017.
//  Copyright © 2017 Julio Martinez. All rights reserved.
//

import UIKit

struct Settings {
    
    static let defaultTintColor = #colorLiteral(red: 0.07843137255, green: 0.6666666667, blue: 0.0862745098, alpha: 1)
    static func defaultVisualEffectView(withFrame frame: CGRect) -> UIVisualEffectView {
        let effect = UIBlurEffect(style: .extraLight)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = frame
        effectView.isUserInteractionEnabled = true
        return effectView
    }
    
    static let apiKey = "br3d8vqbgaunz4m5sfsz89c2"
    static let baseCarImagesURL = URL(string: "http://ak-secure.qa.hotwirestatic.com/current/intl/static/images/car/car-types/275x165/")!
    
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
