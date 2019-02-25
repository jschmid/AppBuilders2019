import Foundation

struct Todo: Codable {
    var id: Int
    var title: String
    var completed: Bool
}

extension Todo {
    func summary() -> String {
        let doneValue = completed ? "✅" : "❌"
        return "\(doneValue) \(title)"
    }
}
