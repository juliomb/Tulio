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
        
        fromDatePicker.setupAsAppDefault()
        untilDatePicker.setupAsAppDefault()
        
        fromDatePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        untilDatePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        
        fromDateTextField.inputView = fromDatePicker
        untilDateTextField.inputView = untilDatePicker
        
        // this will put in the text views the default values
        fromDatePicker.date = Date.tomorrowMorning
        untilDatePicker.date = Date.tomorrowMorning.addingTimeInterval(TimeInterval.defaultRent)
        dateChanged(fromDatePicker)
        dateChanged(untilDatePicker)
    }
    
    func dateChanged(_ datePicker: UIDatePicker) {
        // we can't allow past dates
        if fromDatePicker.date < Date() {
            fromDatePicker.date = Date.currentRoundHour
        }
        // we can't allow that until date is before than from date
        if untilDatePicker.date < fromDatePicker.date+TimeInterval.minimumRent {
            untilDatePicker.date = fromDatePicker.date.addingTimeInterval(TimeInterval.minimumRent)
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
