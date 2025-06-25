import Foundation

@MainActor
class NetworkManager: ObservableObject {
    @Published var posts: [Drink] = []
    @Published var postsPosht: [Drink] = []
    @Published var extraPost: [Drink] = []

    func fetchData() async {
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
        guard let url = URL(string: urlString) else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let results = try JSONDecoder().decode(Results.self, from: data)
            posts = results.drinks
        } catch {
            print(error)
        }
    }

    func fetchDataPosht() async {
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a"
        guard let url = URL(string: urlString) else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let results = try JSONDecoder().decode(ResultsPosht.self, from: data)
            postsPosht = results.drinks
        } catch {
            print(error)
        }
    }

    func searchData(userText: String) async {
        let urlString = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(userText)"
        guard let url = URL(string: urlString) else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let results = try JSONDecoder().decode(Results.self, from: data)
            extraPost = results.drinks
            print("----------------------------------------------")
            print(results)
        } catch {
            print(error)
        }
    }
}
