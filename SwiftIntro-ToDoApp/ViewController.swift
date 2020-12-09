//
//  ViewController.swift
//  SwiftIntro-ToDoApp
//
//  Created by Megan Herold on 12/7/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let tableView: UITableView = {
        UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
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
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ToDoList.shared.toDoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1. Dequeue a reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        // 2. Get default content configuration
        var contentConfiguration = cell.defaultContentConfiguration()
        
        // 3. Configure content
        let toDoItem = ToDoList.shared.toDoItems[indexPath.row]
        contentConfiguration.text = toDoItem.title
        contentConfiguration.secondaryText = toDoItem.notes
        
        // 4. Set the content configuration back to the cell.
        cell.contentConfiguration = contentConfiguration
        return cell
    }
}

