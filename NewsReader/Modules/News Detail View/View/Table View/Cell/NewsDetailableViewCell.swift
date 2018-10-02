//
//  NewsDetailableViewCell.swift
//  NewsReader
//
//  Created by Asif Junaid on 10/2/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit
enum NewsDetailCellType : Int {
    case title
    case byLine
    case description
}
class NewsDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var detail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateCell(cellType : NewsDetailCellType,news : News?){
        switch cellType {
            case .title:
                detail.text = news?.title ?? ""
            case .byLine:
                detail.text = news?.byline ?? ""
                detail.font = UIFont.systemFont(ofSize: 12)
                detail.textColor = UIColor.black.withAlphaComponent(0.6)
            case .description:
                detail.text = news?.abstract ?? ""
                detail.textColor = UIColor.black.withAlphaComponent(0.8)
        }
    }
}
