import Foundation

enum BackendError: Error {
    case objectSerialization(reason: String)
}

extension ApiClient {
    func todosRequest() -> URLRequest {
        let endpoint = "http://localhost:3000/todos"
        guard let url = URL(string: endpoint) else { fatalError() }
        return URLRequest(url: url)
    }
}
