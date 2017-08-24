//
//  SharedFormatters.swift
//  Tulio
//
//  Created by Julio Martinez on 21/08/2017.
//  Copyright © 2017 Julio Martinez. All rights reserved.
//

import Foundation

struct SharedFormatters {
    
    static let dateTimeFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd MMM, HH:mm"
        return df
    }()
    
    static let onlyDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "MM/dd/YYYY"
        return df
    }()
    
    static let onlyTimeFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "HH:mm"
        return df
    }()
    
}
