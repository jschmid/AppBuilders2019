import Foundation

extension ViewController {
    func getTodos() {
        apiClient.todos { [weak self] result in

            switch result {
            case .failure(let error):
                print(error)
            case .success(let todos):
                self?.items = todos
            }
        }
    }
}
