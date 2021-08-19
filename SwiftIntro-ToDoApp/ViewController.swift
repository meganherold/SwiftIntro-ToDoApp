//
//  ViewController.swift
//  SwiftIntro-ToDoApp
//
//  Created by Megan Herold on 12/7/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let tableView: UITableView = {
        UITableView(frame: CGRect(x: 0,
                                  y: 0,
                                  width: UIScreen.main.bounds.width,
                                  height: UIScreen.main.bounds.height))
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setup()
        setupSubviews()
    }
    
    func setup() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
    }
    
    func setupSubviews() {
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDoList.shared.toDoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue our reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        // Get the default content configuration
        var contentConfiguration = cell.defaultContentConfiguration()
        
        // Configure the content
        let toDoItem = ToDoList.shared.toDoItems[indexPath.row]
        contentConfiguration.text = toDoItem.title
        contentConfiguration.secondaryText = toDoItem.notes
        
        // Set it back to our cell
        cell.contentConfiguration = contentConfiguration
        return cell
    }
}

