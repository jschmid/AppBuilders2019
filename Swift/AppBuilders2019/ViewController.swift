import UIKit

class ViewController: UITableViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    let apiClient = ApiClient()

    var items: [Todo] = [Todo]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(named: "Dark")

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")

        getTodos()
    }

    func playWith(todos: [Todo]) {
        debugPrint(todos)

        for todo in todos where todo.completed {
            print(todo)
        }

        let completed = todos.filter { $0.completed }

        print("Completed todos: \(completed.count)")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.backgroundColor = UIColor(named: "Dark")
        cell.textLabel!.text = items[indexPath.row].summary()
        cell.textLabel?.textColor = UIColor(named: "Green")
        return cell
    }
}
