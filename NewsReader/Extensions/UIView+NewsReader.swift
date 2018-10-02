//
//  UIView+NewsReader.swift
//  NewsReader
//
//  Created by Asif Junaid on 10/2/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit

extension UIView {
    func dropShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.withAlphaComponent(0.19).cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 10
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath

    }
}
