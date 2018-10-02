//
//  NewsListViewController.swift
//  NewsReader
//
//  Created by Asif Junaid on 10/2/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit

class NewsListViewController: UIViewController,NetworkFetchable {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(url: URLs.topStories){ [weak self] status in
            DispatchQueue.main.async {
                switch status {
                case .success(let data):
                    print(data)
                case .failure(let error):
                    self?.alert(message: error)
                }
            }
        }
    }
}

