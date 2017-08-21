//
//  QueryViewController.swift
//  Tulio
//
//  Created by Julio Martinez on 21/08/2017.
//  Copyright © 2017 Julio Martinez. All rights reserved.
//

import UIKit

class QueryViewController: UIViewController {
    
    @IBOutlet weak var placeTextField: UITextField!
    @IBOutlet weak var fromDateTextField: UITextField!
    let fromDatePicker = CustomDateTimePicker()
    @IBOutlet weak var untilDateTextField: UITextField!
    let untilDatePicker = CustomDateTimePicker()
    let dateFormatter = SharedFormatters.dateTimeFormatter
    
    @IBAction func searchClicked(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDateInputViews()
    }
    
    func setupDateInputViews(){
        fromDatePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        untilDatePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        
        fromDateTextField.inputView = fromDatePicker
        untilDateTextField.inputView = untilDatePicker
    }
    
    func dateChanged(_ datePicker: UIDatePicker) {
        if datePicker == fromDatePicker {
            fromDateTextField.text = dateFormatter.string(from: datePicker.date)
        } else if datePicker == untilDatePicker {
            untilDateTextField.text = dateFormatter.string(from: datePicker.date)
        }
    }
    
}
