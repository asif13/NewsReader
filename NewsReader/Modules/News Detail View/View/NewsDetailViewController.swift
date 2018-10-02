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
        if let title = viewModel?.news?.subsection,
            !title.isEmpty{
            self.title =  title
        }else {
            //If sub section is empty, set section as title
            title =  viewModel?.news?.section ?? ""
        }
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
        
        thumbnailImg?.sd_setImage(with: thumbnailUrl) { [weak self] (image, error, cache, url) in
            DispatchQueue.main.async {
                guard error == nil else {
                    self?.thumbnailImg.image = UIImage(named: "imageplaceholder")
                    return
                }
                
                self?.thumbnailImg.image = image
            }
        }
    }
}
