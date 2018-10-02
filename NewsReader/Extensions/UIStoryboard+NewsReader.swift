//
//  UIStoryboard+NewsReader.swift
//  NewsReader
//
//  Created by Asif Junaid on 10/2/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    class func instance<T: UIViewController>(name: String = "Main", bundle: Bundle? = nil, identifier: String? = nil) -> T? {
        let storyboard = UIStoryboard(name: name, bundle: bundle)
        
        var viewController: T? = nil
        if let identifier = identifier {
            viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? T
        } else {
            viewController = storyboard.instantiateInitialViewController() as? T
        }
        
        return viewController
    }
}
