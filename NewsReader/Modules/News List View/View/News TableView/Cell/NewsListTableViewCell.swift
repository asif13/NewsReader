//
//  NewsListTableViewCell.swift
//  NewsReader
//
//  Created by Asif Junaid on 10/2/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit
import SDWebImage
class NewsListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var sectionLbl: UILabel!
    @IBOutlet weak var byLineLbl: UILabel!
    @IBOutlet weak var thumbnailImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateCell(news : News){
        titleLbl.text = news.title ?? ""
        sectionLbl.text = news.section ?? ""
        byLineLbl.text = news.byline ?? ""

        guard let thumbnailStr = news.multimedia?.filter({$0.format == NewsImageTypes.thumbnail.rawValue}).first?.url,
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
