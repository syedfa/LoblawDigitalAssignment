//
//  ArticleCell.swift
//  LoblawDigitalAssignment
//
//  Created by Fayyazuddin Syed on 2019-09-30.
//  Copyright © 2019 Fayyazuddin Syed. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    
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
        imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
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
        
        coverImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        coverImageView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
    }
    
}
