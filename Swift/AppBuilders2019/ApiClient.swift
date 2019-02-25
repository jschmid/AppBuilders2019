import Foundation

enum ApiResponse {
    case success([Todo])
    case failure(Error)
}

struct ApiClient {
    func todos(completionHandler: @escaping (ApiResponse) -> Void) {

        let urlRequest = todosRequest()

        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { (data, response, error) in

            // Check for error
            if let error = error {
                completionHandler(ApiResponse.failure(error))
                return
            }

            // Get data
            guard let responseData = data else {
                let error = BackendError.objectSerialization(reason: "No data in response")
                completionHandler(ApiResponse.failure(error))
                return
            }

            let decoder = JSONDecoder()
            do {
                let todos = try decoder.decode([Todo].self, from: responseData)
                completionHandler(ApiResponse.success(todos))
            } catch {
                completionHandler(ApiResponse.failure(error))
            }
        }
        task.resume()
    }
}
