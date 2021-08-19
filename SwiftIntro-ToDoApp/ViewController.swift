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
        view.addSubview(tableView)
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
        return ToDoList.shared.toDoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue our reusable cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath) as? ToDoItemCell else {
            return UITableViewCell()
        }
        
        let toDoItem = ToDoList.shared.toDoItems[indexPath.row]
        cell.configure(title: toDoItem.title,
                       notes: toDoItem.notes,
                       tag: toDoItem.tag,
                       tagColor: toDoItem.tagColor)
        
        return cell
    }
}

