//
//  ViewController.swift
//  SwiftIntro-ToDoApp
//
//  Created by Megan Herold on 12/7/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setup()
        setupSubviews()
        setupConstraints()
    }

    func setup() {
        tableView.register(ToDoItemCell.self, forCellReuseIdentifier: "ToDoItemCell")
        
        tableView.dataSource = self
    }
    
    func setupSubviews() {
        self.view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ToDoList.shared.toDoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1. Dequeue a reusable cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath) as? ToDoItemCell else {
            return UITableViewCell()
        }
        
        let toDoItem = ToDoList.shared.toDoItems[indexPath.row]
        cell.configure(title: toDoItem.title, notes: toDoItem.notes, tag: toDoItem.tagString, tagColor: toDoItem.tagColor)
        return cell
    }
    
    // This is an example of celForRowAt where we configured the UITableViewCell
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // 1. Dequeue a reusable cell
//        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
//
//        // 2. Get default content configuration
//        var contentConfiguration = cell.defaultContentConfiguration()
//
//        // 3. Configure content
//        let toDoItem = ToDoList.shared.toDoItems[indexPath.row]
//        contentConfiguration.text = toDoItem.title
//        contentConfiguration.secondaryText = toDoItem.notes
//
//        // 4. Set the content configuration back to the cell.
//        cell.contentConfiguration = contentConfiguration
//        return cell
//    }
}

