//
//  ToDoList.swift
//  SwiftIntro-ToDoApp
//
//  Created by Megan Herold on 12/8/20.
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
        // tagColors[title] = color
        
        if !tagColors.values.contains(color) {
            tagColors.updateValue(color, forKey: title)
        }
    }
    
    func setTag(forItemAt index: Int, to tag: String) throws {
        guard index < toDoItems.count else {
            throw ToDoListError.invalidIndex
        }
        
        if tagColors.keys.contains(tag) {
            toDoItems[index].tagString = tag
        } else {
            throw ToDoListError.invalidTag
        }
        
    }
    
    // "If a func can throw, do you have to have a catch?"
    func someFunc() {
        // Option 1: Handle the error with a do/try/catch
        do {
            try setTag(forItemAt: 1, to: "yes")
        } catch {
            // whatever we want to do here
        }
        
        // Option 2: Don't care about the error. If one is thrown,
        // the code will silently move on.
        try? setTag(forItemAt: 2, to: "no")
    }
}
