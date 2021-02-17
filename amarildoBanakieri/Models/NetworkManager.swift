//
//  File.swift
//  amarildoBanakieri
//
//  Created by User on 11.1.21.
//

import Foundation
import Kingfisher

class NetworkManager: ObservableObject {
    
    @Published var posts = [Drink]()
    
    func fetchData() {
        if let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.drinks
                                print(results)
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    
}
