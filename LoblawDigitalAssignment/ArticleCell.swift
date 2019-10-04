//
//  ArticleCell.swift
//  LoblawDigitalAssignment
//
//  Created by Fayyazuddin Syed on 2019-09-30.
//  Copyright © 2019 Fayyazuddin Syed. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    var imageHeight: NSLayoutConstraint?
    
    let articleTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle , reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        
        stackView.addArrangedSubview(articleTitleLabel)
        stackView.addArrangedSubview(coverImageView)
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 16
        
        coverImageView.clipsToBounds = true
        imageHeight = coverImageView.heightAnchor.constraint(equalToConstant: 150)
        imageHeight?.priority = UILayoutPriority(900)
        imageHeight?.isActive = true
        coverImageView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
    }
    
    func setData(child: Child) {
        articleTitleLabel.text = child.articleData.title
        
        if child.articleData.thumbnail.contains("http") {
            coverImageView.downloadImage(from: child.articleData.thumbnail, completion: { image in
                child.articleData.downloadedImage = image
            })
            
            coverImageView.isHidden = false
            
            let height = child.articleData.imageHeight
            if height > 0 {
                imageHeight?.constant = height
            }
        } else {
            coverImageView.isHidden = true
        }
    }
    
}
