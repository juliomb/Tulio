//
//  ResultsViewController.swift
//  Tulio
//
//  Created by Julio Martinez on 21/08/2017.
//  Copyright © 2017 Julio Martinez. All rights reserved.
//

import UIKit


enum ResultsControllerState {
    case loading
    case noResults
    case noConnection
    case results
}


class ResultsViewController: UIViewController {
    
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var noResultsView: UIView!
    @IBOutlet weak var noConnectionView: UIView!
    @IBOutlet weak var resultsTableView: UITableView!
    
    var searchParams: SearchParams!
    var carResults: [CarResult]?
    
    var state: ResultsControllerState = .loading {
        willSet {
            guard state != newValue else { return }
            switch state {
            case .loading:
                loadingView.isHidden = true
            case .noResults:
                noResultsView.isHidden = true
            case .noConnection:
                noConnectionView.isHidden = true
            case .results:
                resultsTableView.isHidden = true
            }
            
            switch newValue {
            case .loading:
                loadingView.isHidden = false
            case .noResults:
                noResultsView.isHidden = false
            case .noConnection:
                noConnectionView.isHidden = false
            case .results:
                resultsTableView.isHidden = false
                resultsTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CarResultsInteractor(searchParams: searchParams).execute { (carResults) in
            self.carResults = carResults
            self.state = carResults.count > 0 ? .results : .noResults
        }
    }
    
}
