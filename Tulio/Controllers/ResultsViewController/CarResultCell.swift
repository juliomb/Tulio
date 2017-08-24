//
//  CarResultCell.swift
//  Tulio
//
//  Created by Julio Martinez on 22/08/2017.
//  Copyright © 2017 Julio Martinez. All rights reserved.
//

import UIKit
import Kingfisher

class CarResultCell: UITableViewCell {
    
    @IBOutlet weak var carPhotoImageView: UIImageView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var rentalDaysLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    let placeholder = #imageLiteral(resourceName: "carPlaceholder")
    
    private var _carResult: CarResult? = nil
    var carResult: CarResult {
        get {
            return _carResult!
        }
        set {
            _carResult = newValue
            carPhotoImageView.kf.setImage(with: carResult.imageURL, placeholder: placeholder)
            totalPriceLabel.text = "\(carResult.totalPrice) \(carResult.currency)"
            rentalDaysLabel.text = "\(carResult.rentalDays) days"
            locationLabel.text = carResult.location
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        carPhotoImageView.image = placeholder
    }
    
}
