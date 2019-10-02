//
//  APIClient.swift
//  LoblawDigitalAssignment
//
//  Created by Fayyazuddin Syed on 2019-09-26.
//  Copyright © 2019 Fayyazuddin Syed. All rights reserved.
//

import Foundation

enum APIResult<T> {
    case error(Error)
    case success(T)
    case unexpectedResponse
}

struct APIClient {
    
    private static let urlString = "https://www.reddit.com/r/swift/.json"
    
    static let configuration = URLSessionConfiguration.default
    static var session: URLSession = {
        return URLSession(configuration: configuration)
    }()

    static func fetchArticles(completion: @escaping (APIResult<Article>) -> (Void)) {
        
        guard let requestURL = URL(string: urlString) else { return }
        let request = URLRequest(url: requestURL)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let e = error {
                DispatchQueue.main.async {
                    completion(.error(e))
                }
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let articles = try decoder.decode(Article.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(articles))
                    }
                } catch let jsonError {
                    print("Error serializing json:", jsonError)
                }
                
            } else {
                guard let data = data else { return }
                let responseString = String(data: data, encoding: String.Encoding.utf8)
                print("Unexpected response received: \(String(describing: responseString))")
                DispatchQueue.main.async { completion(.unexpectedResponse) }
            }
        }
        task.resume()
    }
    
}

