//
//  NewsListViewController.swift
//  NewsReader
//
//  Created by Asif Junaid on 10/2/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit

class NewsListViewController: UIViewController {
   
    let viewModel = NewsListViewModel()
    @IBOutlet weak var newsListTbl: NewsListTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNewsData()
        addTableViewActions()
    }
    
    func loadNewsData(){
        viewModel.loadNews { [weak self] (status) in
            DispatchQueue.main.async {
                switch status{
                case .success(let news):
                    if let newsResults = news.results{
                        self?.newsListTbl.model = newsResults
                    }
                case .failure(let error):
                    self?.alert(message: error)
                }
            }
        }
    }
    func addTableViewActions(){
        newsListTbl.didSelectItem = { [weak self] news in
            DispatchQueue.main.async {
                guard let detailVC : NewsDetailViewController = UIStoryboard.instance(identifier : "NewsDetailVC") else {
                    return
                }
                detailVC.viewModel = NewsDetailViewModel(news: news)
                self?.navigationController?.pushViewController(detailVC, animated: true)
            }
        }
    }
}

