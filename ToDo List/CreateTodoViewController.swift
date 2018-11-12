//
//  CreateTodoViewController.swift
//  ToDo List
//
//  Created by Peter M Kreppein on 10/24/18.
//  Copyright © 2018 Peter M Kreppein. All rights reserved.
//

import UIKit

class CreateTodoViewController: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    var todoTableVC : ToDoTableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let newTodo = ToDoCoreData(context: context)
            newTodo.important = importantSwitch.isOn
            if let name = nameText.text {
                newTodo.name = name
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
          
        
        navigationController?.popViewController(animated: true)
        
    }
    
   

}
