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
        
        setupWebView()
    }
    
    func setupWebView() {
        view.addSubview(articleWebView)
        articleWebView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        articleWebView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        articleWebView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive  = true
        articleWebView.topAnchor.constraint(equalTo: view.topAnchor).isActive  = true
        //articleWebView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        let request = URLRequest(url: URL(string: articleData?.url ?? "www.cnn.com")!)
        articleWebView.load(request)
    }
}
