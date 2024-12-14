

import Foundation

@MainActor
class MoviesViewModel: ObservableObject {
        
    @Published var dataMovies: [Result] = []
    
    @Published var titulo = ""
    @Published var movieId = 0
    @Published var show = false
    @Published var key = ""
    
    func fetch(movie: String) async {
        do {
            let urlString = "https://api.themoviedb.org/3/search/movie?api_key=a2bdaa04c9371f63d59b2b7987d66ce4&language=en-US&query=\(movie)&page=1&include_adult=false"
            
            guard let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? "") else { return }
            let (data, _) = try await URLSession.shared.data(from: url)
            let json = try JSONDecoder().decode(Movies.self, from: data)
            self.dataMovies = json.results
            
            print(json.results)
            
            
        } catch let error as NSError {
            print("Error en la api:", error.localizedDescription)
        }
    }
    
    func sendItem(item: Result) {
        titulo = item.original_title
        movieId = item.id
        show.toggle()
    }
    
    func fetchVideo() async {
        do {
            let urlString = "https://api.themoviedb.org/3/movie/\(movieId)/videos?api_key=a2bdaa04c9371f63d59b2b7987d66ce4&language=en-US"
            
            guard let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? "") else { return }
            let (data, _) = try await URLSession.shared.data(from: url)
            let json = try JSONDecoder().decode(VideoModel.self, from: data)
            let res = json.results.filter({$0.type.contains("Trailer")})
            self.key = res.first?.key ?? ""
            print(self.key)
            
            print(json.results)
        } catch let error as NSError {
            print("Error en la api:", error.localizedDescription)
        }
    }

}
