//
//  ToDoItem.swift
//  SwiftIntro-ToDoApp
//
//  Created by Megan Herold on 8/18/21.
//

import UIKit

struct ToDoItem {
    
    var title: String
    
    var notes: String
    
    var tag: String?
    
//    var tagColor: UIColor? {
//        if let tag = tag {
//            return ToDoList.shared.tagColors[tag]
//        }
//
//        return nil
//    }
    
    var tagColor: UIColor? {
        guard let tag = tag else { return nil }
        
        return ToDoList.shared.tagColors[tag]
    }
}
