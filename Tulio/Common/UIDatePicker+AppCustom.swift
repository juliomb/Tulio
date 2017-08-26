//
//  UIDatePicker+AppCustom.swift
//  Tulio
//
//  Created by Julio Martinez on 26/08/2017.
//  Copyright © 2017 Julio Martinez. All rights reserved.
//

import UIKit

extension UIDatePicker {
    
    func setupAsSearchDatePicker() {
        self.datePickerMode = .dateAndTime
        self.locale =  Locale(identifier: "en_GB")
        self.minuteInterval = 30
    }
    
}
