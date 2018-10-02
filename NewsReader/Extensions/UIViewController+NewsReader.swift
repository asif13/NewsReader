//
//  UIViewController+NewsReader.swift
//  NewsReader
//
//  Created by Asif Junaid on 10/2/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit

extension UIViewController {
    //Shows alert on screen
    func alert(_ title: String? = nil, message: String, completion :(()->())? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
        alertController.addAction(ok)
        present(alertController, animated: true, completion: nil)
    }
}
