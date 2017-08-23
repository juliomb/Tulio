//
//  CarResultCell.swift
//  Tulio
//
//  Created by Julio Martinez on 22/08/2017.
//  Copyright © 2017 Julio Martinez. All rights reserved.
//

import UIKit

class CarResultCell: UITableViewCell {
    
    @IBOutlet weak var carTypeCodeLabel: UILabel!
    
    private var _carResult: CarResult? = nil
    var carResult: CarResult {
        get {
            return _carResult!
        }
        set {
            _carResult = newValue
            carTypeCodeLabel.text = carResult.carTypeCode
        }
    }
    
}
