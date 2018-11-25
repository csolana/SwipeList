//
//  ViewController.swift
//  SwipeList
//
//  Created by Carlos Solana on 11/21/18.
//  Copyright © 2018 Cybermoth. All rights reserved.
//

import UIKit

class SwipeListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Item One"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Item Two"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Item Three"
        itemArray.append(newItem3)
        
        let newItem4 = Item()
        newItem4.title = "Item Four"
        itemArray.append(newItem4)
        
        
        
        if let items = defaults.array(forKey: "SwipeListArray") as? [Item] {
        itemArray = items
        }
        
    }
    
    //MARK - TaableViewDataSource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = itemArray[indexPath.row]
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = item.title
        
        
        //Tenary operator
        //value = condition ? valueIftrue : valueIfFalse
        cell.accessoryType = item.done ? .checkmark : .none
        
        
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //if is true becomes false and if false becomes true
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
    

        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    
        
    }
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen when user press this Add Item button(action) on our UIAlert
            
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "SwipeListArray")
            
            self.tableView.reloadData()
//            print(textField.text!)
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter new item"
            textField = alertTextField
            
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

