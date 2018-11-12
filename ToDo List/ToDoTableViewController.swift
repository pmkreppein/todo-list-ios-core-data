//
//  ToDoTableViewController.swift
//  ToDo List
//
//  Created by Peter M Kreppein on 10/24/18.
//  Copyright © 2018 Peter M Kreppein. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    var todoCoreDataArray : [ToDoCoreData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTodos()
    }
    
    func getTodos(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let todosFromCoreData = try? context.fetch(ToDoCoreData.fetchRequest()){
                if let todoint = todosFromCoreData as? [ToDoCoreData]{
                    todoCoreDataArray = todoint
                    tableView.reloadData()
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return todoCoreDataArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        // Configure the cell...
        var labelText = ""
        let thisTodo = todoCoreDataArray[indexPath.row]
        
        if thisTodo.important {
            if let name = thisTodo.name {
                cell.textLabel?.text = "🚨 \(name)"
            }
        } else {
            if let name = thisTodo.name {
            cell.textLabel?.text = "\(name)"
            
            }
        }
        
        
    
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTodo = todoCoreDataArray[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: selectedTodo)
    }
    
    //Prepare for Segue Function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let createVC = segue.destination as? CreateTodoViewController {
            createVC.todoTableVC = self
            }
    
        if let completeVC = segue.destination as? CompleteViewController {
           if let selectedTodo = sender as? ToDoCoreData {
                completeVC.thisTodo = selectedTodo
            }

        }
    
    
    
    } //Class End
    

}
