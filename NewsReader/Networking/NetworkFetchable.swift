//
//  NetworkFetchable.swift
//  NewsReader
//
//  Created by Asif Junaid on 10/1/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import Foundation

enum NetworkResponseStatus {
    case success(Data)
    case failure(String)
}

protocol NetworkFetchable {
    func fetchData(url : URL?, completion: @escaping ((NetworkResponseStatus) -> ()))
}

extension NetworkFetchable {
    
    func fetchData(url : URL?, completion: @escaping ((NetworkResponseStatus) -> ())){
        
        guard let `url` = url else {
            completion(.failure(NetworkErrors.serverError))
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue(Keys.NYTApiKey, forHTTPHeaderField: "api-key")
        
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard error == nil else {
                completion(.failure(error?.localizedDescription ?? NetworkErrors.serverError))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkErrors.serverError))
                return
            }
            print(String(data: data, encoding: .utf8)!)
            completion(.success(data))
        }
        
        task.resume()
    }
    
}
