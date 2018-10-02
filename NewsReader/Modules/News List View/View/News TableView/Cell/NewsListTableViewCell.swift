//
//  NewsListTableViewCell.swift
//  NewsReader
//
//  Created by Asif Junaid on 10/2/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit
class NewsListTableViewCell: UITableViewCell,ImageFetchable{

    @IBOutlet weak var backgroundCellView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var sectionLbl: UILabel!
    @IBOutlet weak var byLineLbl: UILabel!
    @IBOutlet weak var thumbnailImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundCellView.dropShadow()
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
        loadImage(url: thumbnailUrl, imageView: thumbnailImg)
    }
}
