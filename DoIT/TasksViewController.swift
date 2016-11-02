
//  TasksViewController.swift
//  DoIT
//
//  Created by Neil Johnson on 2/11/16.
//  Copyright © 2016 Smokeypo. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.important {
             cell.textLabel?.text = "❗️\(task.name)"
        } else {
             cell.textLabel?.text = task.name
        }
        
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
        
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Mow the Lawn"
        task1.important = false
        
        let task2 = Task()
      task2.name = "By Feta Cheese"
        task2.important = false
        
        let task3 = Task()
        task3.name = "Feed the Fish"
        task3.important = true
        
        let task4 = Task()
        task4.name = "But Nick Cave Tickets"
        task4.important = true

        let task5 = Task()
        task5.name = "Book Flights"
        task5.important = true

        let task6 = Task()
        task6.name = "Buy Printer Ink"
        task6.important = false
        
        return [task1, task2, task3, task4, task5, task6]

        


}
    @IBAction func plusTapped(_ sender: AnyObject) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue" {
        let nextVC = segue.destination as!
        CreateTaskViewController
        nextVC.previousVC = self
      }
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as!
            CompleteTaskViewController
            nextVC.task = sender as! Task
             nextVC.previousVC = self
        }
    }
 }
