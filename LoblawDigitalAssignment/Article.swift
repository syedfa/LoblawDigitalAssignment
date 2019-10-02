//
//  Article.swift
//  LoblawDigitalAssignment
//
//  Created by Fayyazuddin Syed on 2019-09-26.
//  Copyright © 2019 Fayyazuddin Syed. All rights reserved.
//

import Foundation
import UIKit

struct Article: Decodable {
    let data: RedditData
}

struct RedditData: Decodable {
    let children: [Child]
}

struct Child: Decodable {
    let articleData: ArticleData
    
    enum CodingKeys: String, CodingKey {
        case articleData = "data"
    }
}

struct ArticleData: Decodable {
    let title: String
    let url: String
    //need to add keys to capture imageURL which for some reason is not working.
}
