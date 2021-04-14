//
//  File.swift
//  amarildoBanakieri
//
//  Created by User on 11.1.21.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Drink]()
    @Published var postsPosht = [Drink]()
    @Published var extraPost = [Drink]()

    func fetchData() {
        let urlString: String = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
        if let url = URL(string: urlString) {
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
    
    func fetchDataPosht() {
        let urlString: String = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(ResultsPosht.self, from: safeData)
                            DispatchQueue.main.async {
                                self.postsPosht = results.drinks
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

    func searchData(userText: String) {
            
            let urlString: String = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(userText)"
            if let url = URL(string: urlString) {
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { (data, response, error) in
            if error == nil {
                let decoder = JSONDecoder()
                if let safeData = data {
                    do {
                        let results = try decoder.decode(Results.self, from: safeData)
                        DispatchQueue.main.async {
                            self.extraPost = results.drinks
                            print("----------------------------------------------------------------------------------------------")
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

