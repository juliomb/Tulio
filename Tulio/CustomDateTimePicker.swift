//
//  CustomDateTimePicker.swift
//  Tulio
//
//  Created by Julio Martinez on 21/08/2017.
//  Copyright © 2017 Julio Martinez. All rights reserved.
//

import UIKit

class CustomDateTimePicker: UIDatePicker {
    
    let defaultLocale = Locale(identifier: "en_GB")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.datePickerMode = .dateAndTime
        self.locale = defaultLocale
        self.minuteInterval = 30
    }
    
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
