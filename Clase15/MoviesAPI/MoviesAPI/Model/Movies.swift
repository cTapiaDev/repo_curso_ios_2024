
import Foundation

struct Movies: Codable {
    let page: Int
    let results: [Result]
}

struct Result: Codable, Identifiable {
    let id: Int
    let original_title: String
    let poster_path: String?
    let overview: String
}

struct VideoModel: Codable {
    let id: Int
    let results: [VideoResult]
}

struct VideoResult: Codable {
    let key: String
    let type: String
}
