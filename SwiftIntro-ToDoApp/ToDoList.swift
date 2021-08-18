//
//  ToDoList.swift
//  SwiftIntro-ToDoApp
//
//  Created by Megan Herold on 8/18/21.
//

import UIKit

class ToDoList {
    
    enum ToDoListError: Error {
        case invalidIndex
        case invalidTag
    }
    
    static let shared = ToDoList()
    
    private(set) var toDoItems = [ToDoItem]()
    
    var tagColors: [String: UIColor] = [
        "Work": .blue,
        "Home": .orange,
        "Urgent": .red
    ]
    
    private init() { }
    
    func addItem(_ item: ToDoItem) {
        toDoItems.append(item)
    }
    
    func remove(at index: Int) {
        toDoItems.remove(at: index)
    }
    
    func addTag(title: String, color: UIColor) {
        //tagColors[title] = color //subscript method
        
        if !tagColors.values.contains(color) {
            tagColors.updateValue(color, forKey: title)
        }
    }
    
    func setTag(forItemAt index: Int, to tag: String) throws {
        guard index < toDoItems.count else {
            throw ToDoListError.invalidIndex
        }
        
        if tagColors.keys.contains(tag) {
            toDoItems[index].tag = tag
        } else {
            throw ToDoListError.invalidTag
        }
    }
}
