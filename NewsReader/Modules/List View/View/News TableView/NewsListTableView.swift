//
//  NewsListTableView.swift
//  NewsReader
//
//  Created by Asif Junaid on 10/2/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit

class NewsListTableView: UITableView {
    var model = [News](){
        didSet {
            reloadData()
        }
    }
    let cellIdentifier = "NewsListTableViewCell"
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
extension NewsListTableView : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NewsListTableViewCell else {
            return UITableViewCell()
        }
        cell.updateCell(news: model[indexPath.row])
        return cell
    }
    
}
