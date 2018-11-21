//
//  ViewController.swift
//  TodoList
//
//  Created by Kamil Ben on 21/11/2018.
//  Copyright © 2018 Dark Folt. All rights reserved.
//

import UIKit
import Foundation

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Find Mike","Buy Eggos","Destroy Demogorgon"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK- TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    
    //MARK- TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
        //Quand je selection une cell ça chekmark
        if (tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark){
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
         tableView.deselectRow(at: indexPath, animated: true) //Pour enlever la selection grise
        
        
    }
    
    
    //MARK - Add New Items button
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()  //Pour emener le textfield dans l'action pour l'afficher
        
        let alert = UIAlertController(title: "Ajouter un nouveau Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ajouter Item", style: .default) { (action) in
            //Une fois que j'aurai clicker pour ajouter un item
            print("Success")
            print(textField.text!)
            self.itemArray.append(textField.text!)
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Creer un nouveau item"
            textField = alertTextField
        }
        
        
        //J'ajoute cette action dans mon alert
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    


}

