//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Nadia Ahmadian on 2021-04-12.
//

import Foundation

class NetworkManger : ObservableObject{
    @Published var posts = [Post]()
    
    
    func fetchData(){
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration:.default)
            let task = session.dataTask(with: url) { (data, res, err) in
                if err == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do{
                           let results = try decoder.decode(Results.self,from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        }catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
