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
        webView.navigationDelegate = self
        loadUrl()
    }
    func loadUrl(){
        guard let url = viewModel?.url else { return }
        ActivityIndicator.shared.showProgressView()
        webView.load(URLRequest(url: url))
    }
}

extension WebViewController : WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Did finish")
        DispatchQueue.main.async {
            ActivityIndicator.shared.hideProgressView()
        }
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("Did fail")
        DispatchQueue.main.async {
            ActivityIndicator.shared.hideProgressView()
        }
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            ActivityIndicator.shared.hideProgressView()
        })
    }
}
