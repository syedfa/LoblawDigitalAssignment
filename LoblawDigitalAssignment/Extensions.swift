//
//  Extensions.swift
//  LoblawDigitalAssignment
//
//  Created by Fayyazuddin Syed on 2019-10-03.
//  Copyright © 2019 Fayyazuddin Syed. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func downloadImage(from url: String?, placeholder: UIImage? = nil, completion: ((UIImage?) -> Void)? = nil) {
        guard let url = url, let nsurl = URL(string: url) else { return }
        kf.setImage(with: ImageResource(downloadURL: nsurl), placeholder: placeholder) { data in
            let image = try? data.get()
            completion?(image?.image)
        }
    }
}
