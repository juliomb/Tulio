//
//  CarResultDetailViewController.swift
//  Tulio
//
//  Created by Julio Martinez on 23/08/2017.
//  Copyright © 2017 Julio Martinez. All rights reserved.
//

import UIKit
import Kingfisher

class CarResultDetailViewController: UIViewController {
    
    @IBOutlet weak var carPhotoImageView: UIImageView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var taxesLabel: UILabel!
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var dailyRateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationDescriptionLabel: UILabel!
    @IBOutlet weak var pickupLabel: UILabel!
    @IBOutlet weak var dropoffLabel: UILabel!
    @IBOutlet weak var rentalDaysLabel: UILabel!
    @IBOutlet weak var getItButton: UIButton! {
        didSet {
            getItButton.layer.cornerRadius = getItButton.frame.height/2
        }
    }
    
    var carResult: CarResult!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        syncViewWithModel()
    }
    
    func syncViewWithModel() {
        
        carPhotoImageView.kf.setImage(with: carResult.imageURL, placeholder: #imageLiteral(resourceName: "carPlaceholder"))
        totalPriceLabel.text = "\(carResult.totalPrice) \(carResult.currency)"
        taxesLabel.text = "Taxes/fees: \(carResult.taxesAndFees) \(carResult.currency)"
        subtotalLabel.text = "Subtotal: \(carResult.subTotal) \(carResult.currency)"
        dailyRateLabel.text = "Daily: \(carResult.dailyRate) \(carResult.currency)"
        locationLabel.text = carResult.location
        locationDescriptionLabel.text = carResult.locationDescription
        pickupLabel.text = "Pickup: \(carResult.pickupDay)   \(carResult.pickupTime)"
        dropoffLabel.text = "Dropoff: \(carResult.dropoffDay)   \(carResult.dropoffTime)"
        rentalDaysLabel.text = "Rental days: \(carResult.rentalDays)"
        
    }
    
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func getItClicked(_ sender: Any) {
        if let url = carResult.deepLink {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            let alertController = UIAlertController(title: nil, message: "Sorry, service unavailable for this car.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }
    
    
}
