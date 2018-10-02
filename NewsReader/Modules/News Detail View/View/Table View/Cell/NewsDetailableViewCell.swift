//
//  NewsDetailableViewCell.swift
//  NewsReader
//
//  Created by Asif Junaid on 10/2/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit

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
    func updateCell(index : Int,news : News?){
        switch index {
        case 0:
            detail.text = news?.title ?? ""
        case 1:
            detail.text = news?.byline ?? ""
        case 2:
            detail.text = news?.abstract ?? ""
        default:
            detail.text = ""
        }
    }
}
