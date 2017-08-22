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
    // TODO
    
    init?(json: Dictionary<String, Any>) {
        guard let carTypeCode = json["CarTypeCode"] as? String else { return nil }
        // TODO
        
        self.carTypeCode = carTypeCode
    }
    
}
