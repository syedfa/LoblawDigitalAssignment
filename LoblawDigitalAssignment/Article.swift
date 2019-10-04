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

class Child: Decodable {
    var articleData: ArticleData
    
    enum CodingKeys: String, CodingKey {
        case articleData = "data"
    }
}

struct ArticleData: Decodable {
    let title: String
    let url: String
    let thumbnail: String
    let thumbnailHeight: Int?
    let thumbnailWidth: Int?
    var downloadedImage: UIImage?
    var ratio: CGFloat {
        if let thumbHeight = thumbnailHeight,
            let thumbWidth = thumbnailWidth,
            thumbWidth > 0 {
            return CGFloat(thumbHeight) / CGFloat(thumbWidth)
        }
        return 0
    }
    
    var imageHeight: CGFloat {
        let width = UIScreen.main.bounds.width - 32
        return width * ratio
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case url
        case thumbnail
        case thumbnailHeight = "thumbnail_height"
        case thumbnailWidth = "thumbnail_width"
    }
    
}
