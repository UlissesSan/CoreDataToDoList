//
//  ViewController.swift
//  CoreDataToDoList
//
//  Created by Ulisses Santana on 21/04/17.
//  Copyright © 2017 Ulisses Santana. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

  @IBOutlet weak var tableView: UITableView!
  
  var tasks : [Task] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    tableView.dataSource = self
    tableView.delegate = self
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    //get the data from core data
    getData()
    //reload the table view
    tableView.reloadData()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tasks.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    
    let task = tasks[indexPath.row]
    
    //If switch is turned on do this
    if task.isImportant{
      
      cell.textLabel?.text = "🔥 \(task.name!)"
    
    // If not do this
    }else{

      cell.textLabel?.text = task.name!
      
    }
    
    return cell
  }
  
  // swaping to delete the task
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    if editingStyle == .delete{
      let task = tasks[indexPath.row]
      context.delete(task)
      //to save the context
      (UIApplication.shared.delegate as! AppDelegate).saveContext()
    
      do{
        tasks = try context.fetch(Task.fetchRequest())
      }
      catch{
        print("Fetching FUCKING Failed!")
      }
    }
    tableView.reloadData()
    
  }
  
  func getData(){
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    do{
      tasks = try context.fetch(Task.fetchRequest())
    }
    catch{
      print("Fetching FUCKING Failed!")
    }
      
    
  }
  

}

