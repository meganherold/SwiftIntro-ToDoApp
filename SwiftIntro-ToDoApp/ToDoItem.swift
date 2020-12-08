//
//  ToDoItem.swift
//  SwiftIntro-ToDoApp
//
//  Created by Megan Herold on 12/8/20.
//

import UIKit

struct ToDoItem {
    
    var title: String
    
    var notes: String
    
    var tagString: String?
    
    var tagColor: UIColor? {
        // Option 1: if-let
//        if let tag = tagString {
//            return ToDoList.shared.tagColors[tag]
//        }
//        return nil
        
        // Option 2: guard-let
        guard let tag = tagString else { return nil }
        
        return ToDoList.shared.tagColors[tag]
    }
}
