//
//  CompleteViewController.swift
//  ToDo List
//
//  Created by Peter M Kreppein on 10/24/18.
//  Copyright © 2018 Peter M Kreppein. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    var thisTodo : ToDoCoreData? = nil
    @IBOutlet weak var nameLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let theTodo = thisTodo {
            nameLabel.text = theTodo.name
        }
        
        if  thisTodo?.important ?? false{
            self.view.backgroundColor = UIColor.red
            
        }
     
    }
    


    
    
    @IBAction func completeTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let theTodo = thisTodo{
                context.delete(theTodo)
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
        navigationController?.popViewController(animated: true)
    }
    
}
