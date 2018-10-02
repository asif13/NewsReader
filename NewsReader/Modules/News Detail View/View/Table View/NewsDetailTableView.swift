//
//  NewsDetailTableView.swift
//  NewsReader
//
//  Created by Asif Junaid on 10/2/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit

class NewsDetailTableView: UITableView {
    let cellIdentifier = "NewsDetailCell"
    var model : News?{
        didSet {
            reloadData()
        }
    }
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    func setup(){
        delegate = self
        dataSource = self
    }
}
extension NewsDetailTableView : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NewsDetailTableViewCell else {
            return UITableViewCell()
        }
        cell.updateCell(index: indexPath.row, news: model)
        return cell
    }
  
}
