//
//  SearchViewController+SearchForm.swift
//  Tulio
//
//  Created by Julio Martinez on 22/08/2017.
//  Copyright © 2017 Julio Martinez. All rights reserved.
//

import UIKit

extension SearchViewController: UITextFieldDelegate {
    
    func setupDateInputViews(){
        fromDatePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        untilDatePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        
        fromDateTextField.inputView = fromDatePicker
        untilDateTextField.inputView = untilDatePicker
        
        // this will put in the text views the default values
        fromDatePicker.date = Settings.initialFromDate
        untilDatePicker.date = Settings.initialFromDate.addingTimeInterval(Settings.defaultRentInterval)
        dateChanged(fromDatePicker)
        dateChanged(untilDatePicker)
    }
    
    func dateChanged(_ datePicker: UIDatePicker) {
        // we can't allow past dates
        if fromDatePicker.date < Date() {
            fromDatePicker.date = Settings.minimumFromDate
        }
        // we can't allow that until date is before than from date
        if untilDatePicker.date < fromDatePicker.date+Settings.minimumRentInterval {
            untilDatePicker.date = fromDatePicker.date.addingTimeInterval(Settings.minimumRentInterval)
        }
        fromDateTextField.text = dateFormatter.string(from: fromDatePicker.date)
        untilDateTextField.text = dateFormatter.string(from: untilDatePicker.date)
    }
    
    func formResignFirstResponder() {
        placeTextField.resignFirstResponder()
        fromDateTextField.resignFirstResponder()
        untilDateTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        performSegue(withIdentifier: "showResultsSegue", sender: self)
        return true
    }
    
}
