//
//  NewsListViewModel.swift
//  NewsReader
//
//  Created by Asif Junaid on 10/2/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import Foundation

enum NewsResponseStatus {
    case success(NewsModel)
    case failure(String)
}
class NewsListViewModel : NetworkFetchable {
    
    //Loads the news and updates the view with News model
    func loadNews(completion: @escaping ((NewsResponseStatus) -> ())){
        fetchData(url: URLs.topStories){ status in
            DispatchQueue.main.async {
                switch status {
                case .success(let data):
                    print(data)
                    let decoder = JSONDecoder()
                    
                    guard  let newsResponse = try? decoder.decode(NewsModel.self, from: data)  else {
                        completion(.failure(NetworkErrors.serverError))
                        return
                    }
                    
                    completion(.success(newsResponse))
                    
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
