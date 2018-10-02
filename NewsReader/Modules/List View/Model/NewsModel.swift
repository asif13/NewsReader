//
//  NewsModel.swift
//  NewsReader
//
//  Created by Asif Junaid on 10/2/18.
//  Copyright © 2018 Asif Junaid. All rights reserved.
//

import UIKit

struct NewsModel : Codable {
    var num_results : Int?
    var results : [News]?
}
struct News : Codable {
    var section : String?
    var subsection : String?
    var title : String?
    var abstract : String?
    var byline : String?
    var multimedia : [NewsMultimedia]?
}

struct NewsMultimedia : Codable {
    var url : String?
    var format : String?
}
