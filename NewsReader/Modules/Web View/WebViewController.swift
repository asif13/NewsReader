//
//  WebViewController.swift
//  NewsReader
//
//  Created by Asif Junaid on 10/2/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    var viewModel : WebViewModel?
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUrl()
    }
    func loadUrl(){
        guard let url = viewModel?.url else { return }
        webView.load(URLRequest(url: url))
    }
}
