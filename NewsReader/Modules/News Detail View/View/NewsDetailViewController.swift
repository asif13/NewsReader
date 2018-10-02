//
//  NewsDetailViewController.swift
//  NewsReader
//
//  Created by Asif Junaid on 10/2/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
    var viewModel : NewsDetailViewModel?
    @IBOutlet weak var newsDetailTbl: NewsDetailTableView!
    @IBOutlet weak var thumbnailImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUserInterface()
    }
    func updateUserInterface(){
        newsDetailTbl.model = viewModel?.news
        updateDetailImage()
        updateNavigationTitle()
    }
    func updateNavigationTitle(){
        guard let title = viewModel?.news?.subsection,
            !title.isEmpty else {
            //If sub section is empty, set section as title
            self.title =  viewModel?.news?.section ?? ""
            return
        }
        self.title =  title
    }
    func updateDetailImage(){
        guard let thumbnailStr = viewModel?.news?.multimedia?.filter({$0.format == NewsImageTypes.medium.rawValue}).first?.url,
            let thumbnailUrl = URL(string: thumbnailStr)
            else {
                thumbnailImg.image = UIImage(named: "imageplaceholder")
                return
        }
        //Set SDWebImage to download image async
        thumbnailImg.sd_setShowActivityIndicatorView(true)
        
        thumbnailImg.sd_setIndicatorStyle(.gray)
     
        thumbnailImg.sd_setImage(with: thumbnailUrl) { [weak self] (image, error, cache, url) in
            DispatchQueue.main.async {
                guard error == nil else {
                    self?.thumbnailImg.image = UIImage(named: "imageplaceholder")
                    return
                }
                
                self?.thumbnailImg.image = image
            }
        }
    }
    
    @IBAction func readMoreAction(_ sender: UIButton) {
        guard let urlStr = viewModel?.news?.url,
           let url = URL(string: urlStr)
            else {
                return
        }
        guard let webViewVC : WebViewController = UIStoryboard.instance(identifier: "WebViewVC") else {
            return
        }
        webViewVC.viewModel = WebViewModel(url: url)
        navigationController?.pushViewController(webViewVC, animated: true)
    }
}
