//
//  ArticleListDataSource.swift
//  LoblawDigitalAssignment
//
//  Created by Fayyazuddin Syed on 2019-09-28.
//  Copyright © 2019 Fayyazuddin Syed. All rights reserved.
//

import UIKit

class ArticleListDataSource: NSObject, UITableViewDataSource {
    
    var articleArray = [Child]()
    var cellIdentifier: String!
    
    init(cellIdentifier: String) {
        self.cellIdentifier = cellIdentifier
    }
    
    func fetchArticles(completion: @escaping () -> Void) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        APIClient.fetchArticles { result in
            
            switch result {
            case .error(let e):
                print("Error: " + e.localizedDescription)
            case .unexpectedResponse:
                print(("Invalid Response: The server returned an invalid response."))
            case .success(let articleList):
                self.articleArray = articleList.data.children
                completion()
            }
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ArticleCell
        let child = articleArray[indexPath.row]
        cell.setData(child: child)
        
        return cell
    }
}
