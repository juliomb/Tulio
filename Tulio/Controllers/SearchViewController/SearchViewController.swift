//
//  SearchViewController.swift
//  Tulio
//
//  Created by Julio Martinez on 21/08/2017.
//  Copyright © 2017 Julio Martinez. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var placeTextField: UITextField!
    @IBOutlet weak var fromDateTextField: UITextField!
    let fromDatePicker = UIDatePicker()
    @IBOutlet weak var untilDateTextField: UITextField!
    let untilDatePicker = UIDatePicker()
    let dateFormatter = SharedFormatters.dateTimeFormatter
    
    @IBOutlet weak var searchButton: UIButton!{
        didSet {
            searchButton.layer.cornerRadius = searchButton.frame.height/2
        }
    }
    
    
    @IBOutlet weak var formVerticalAlignmentConstraint: NSLayoutConstraint!
    @IBOutlet weak var stackViewTopSpaceToViewContrstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDateInputViews()
        placeTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tearDownKeyboardNotification()
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if placeTextField.text == nil || placeTextField.text?.isEmpty == true {
            let alertController = UIAlertController(title: nil, message: "Please, tell us where you want to pick up the car.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResultsSegue"{
            let destVC = segue.destination as! ResultsViewController
            destVC.searchParams = SearchParams(place: placeTextField.text!, fromDate: fromDatePicker.date, untilDate: untilDatePicker.date)
            formResignFirstResponder()
        }
    }
    
    @IBAction func tappedInBackground(_ sender: Any) {
        formResignFirstResponder()
    }
    
    @IBAction func swippedUpInBackground(_ sender: Any) {
        formResignFirstResponder()
    }

    
}
