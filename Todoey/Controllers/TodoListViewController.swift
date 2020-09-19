// Created by AppMill 2020
// Modified to test GitHub

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)

        let newItem2 = Item()
        newItem.title = "Buy Eggos"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem.title = "Destroy Demogorgon"
        itemArray.append(newItem3)
        
        print("ITemarray \(itemArray)")
        
        // if let items = defaults.array(forKey: K.defaultKeys.toDoList) as? [String] {
        //     itemArray = items
        }
    
    
    // MARK - Add new items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new to Todoey item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            // what will happen once the user clicks the add item button on UIAlert
            // Missing a code piece to prevent empty input in the textfield by the user
            
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            // Copio in defaults i valori dell'array
            self.defaults.set(self.itemArray, forKey: K.defaultKeys.toDoList)
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
}

//MARK: - TableViewDataSource methods

extension TodoListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cells.itemCell, for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        return cell
    }
}

// MARK: - TableView delegate methods

extension TodoListViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // print(itemArray[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark}
    }
}