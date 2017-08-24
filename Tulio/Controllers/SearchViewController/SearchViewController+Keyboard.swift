//
//  SearchViewController+Keyboard.swift
//  Tulio
//
//  Created by Julio Martinez on 23/08/2017.
//  Copyright © 2017 Julio Martinez. All rights reserved.
//

import UIKit

extension SearchViewController {
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowNotification(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHideNotification(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    func tearDownKeyboardNotification() {
        NotificationCenter.default.removeObserver(self)
    }
    
    func keyboardWillShowNotification(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double else { return }
        
        UIView.animate(withDuration: duration, delay: 0.0, options: [.beginFromCurrentState], animations: {
            self.formVerticalAlignmentConstraint.isActive = false
            self.stackViewTopSpaceToViewContrstraint.isActive = true
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    func keyboardWillHideNotification(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double else { return }
        
        UIView.animate(withDuration: duration, delay: 0.0, options: [.beginFromCurrentState], animations: {
            self.formVerticalAlignmentConstraint.isActive = true
            self.stackViewTopSpaceToViewContrstraint.isActive = false
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

}
