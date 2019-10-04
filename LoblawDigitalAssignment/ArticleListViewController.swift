//
//  ArticleListViewController.swift
//  LoblawDigitalAssignment
//
//  Created by Fayyazuddin Syed on 2019-09-26.
//  Copyright © 2019 Fayyazuddin Syed. All rights reserved.
//

import UIKit

class ArticleListViewController: UITableViewController {

    var articleArray = [Child]()
    var articleListDataSource: ArticleListDataSource!
    
    let cellIdentifier = "ArticleCell"
    let navTitle = "Swift News"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = navTitle
        tableView.register(ArticleCell.self, forCellReuseIdentifier: cellIdentifier)
        setupTableView()
    }
    
    func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        
        articleListDataSource = ArticleListDataSource(cellIdentifier: cellIdentifier)
        articleListDataSource.fetchArticles {
            self.tableView.reloadData()
        }
        
        tableView.dataSource = articleListDataSource
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articleVC = ArticleViewController()
        let child = articleListDataSource.articleArray[indexPath.row]
        articleVC.articleData = child.articleData
        navigationController?.pushViewController(articleVC, animated: true)
    }
}

