//
//  AddTaskViewController.swift
//  CoreDataToDoList
//
//  Created by Ulisses Santana on 22/04/17.
//  Copyright © 2017 Ulisses Santana. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

  
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var isImp: UISwitch!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  @IBAction func btnDone(_ sender: Any) {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let task = Task(context: context)
    task.name = textField.text!
    task.isImportant = isImp.isOn
    
    //Saving the data to core data
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
    
    //getting the data to the other view
    navigationController?.popViewController(animated: true)
    
  }
}
