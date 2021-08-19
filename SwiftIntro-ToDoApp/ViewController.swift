//
//  ViewController.swift
//  SwiftIntro-ToDoApp
//
//  Created by Megan Herold on 12/7/20.
//

import UIKit

class ViewController: UIViewController {
    
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
    }
    
    func setupSubviews() {
        view.addSubview(tableView)
    }
}

