//
//  UIVisualEffectView+AppCustom.swift
//  Tulio
//
//  Created by Julio Martinez on 26/08/2017.
//  Copyright © 2017 Julio Martinez. All rights reserved.
//

import UIKit

extension UIVisualEffectView {
    
    static func appDefault(withFrame frame: CGRect) -> UIVisualEffectView {
        let effect = UIBlurEffect(style: .extraLight)
        let effectView = self.init(effect: effect)
        effectView.frame = frame
        effectView.isUserInteractionEnabled = true
        return effectView
    }
    
}
