//
//  NetworkConstants.swift
//  NewsReader
//
//  Created by Asif Junaid on 10/2/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//
import Foundation

struct Keys{
    static let NYTApiKey = "8c11b2f2ab7a436ebe432b403c4c0094"
}

struct URLs {
    static let topStories = URL(string: "https://api.nytimes.com/svc/topstories/v2/home.json")
}

struct NetworkErrors {
    static let serverError = "Cannot connect to server.Please try again later."
}
