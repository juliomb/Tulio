//
//  ResultsViewController+Table.swift
//  Tulio
//
//  Created by Julio Martinez on 22/08/2017.
//  Copyright © 2017 Julio Martinez. All rights reserved.
//

import UIKit

extension ResultsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carResults?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let carResult = carResults?[indexPath.row] else {
            fatalError()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarResultIdentifier", for: indexPath) as! CarResultCell
        cell.carResult = carResult
        return cell
    }
    
}
