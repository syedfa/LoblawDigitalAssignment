//
//  ArticleViewController.swift
//  LoblawDigitalAssignment
//
//  Created by Fayyazuddin Syed on 2019-09-28.
//  Copyright © 2019 Fayyazuddin Syed. All rights reserved.
//

import UIKit
import WebKit

class ArticleViewController: UIViewController {
    
    var articleData: ArticleData?
    var imageHeight: NSLayoutConstraint?
    
    let articleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    fileprivate var articleWebView: WKWebView = {
        let webView = WKWebView(frame: .zero)
        webView.backgroundColor = .clear
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        navigationItem.title = articleData?.title
        
        setupArticleView()
        
        articleImageView.image = articleData?.downloadedImage
        articleImageView.isHidden = articleData?.downloadedImage == nil
        
        if let ratio = articleData?.ratio {
            let height = UIScreen.main.bounds.width * ratio
            imageHeight?.constant = height
        }
        
    }
    
    func setupArticleView() {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
        
        articleImageView.clipsToBounds = true
        imageHeight = articleImageView.heightAnchor.constraint(equalToConstant: 150)
        imageHeight?.priority = UILayoutPriority(900)
        imageHeight?.isActive = true
        
        stackView.addArrangedSubview(articleImageView)
        stackView.addArrangedSubview(articleWebView)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 16
        
        let request = URLRequest(url: URL(string: articleData?.url ?? "www.cnn.com")!)
        articleWebView.load(request)
    }
}
