//
//  ItemModel.swift
//  ToDoList
//
//  Created by Nandini Nema on 7/3/24.
//

import Foundation

// This is our model of our app, make it indentifiable ( for for loop giving it a random id

// immutable struct!!
// make it confirm to codable which means you can decode and encode data with json 
struct ItemModel: Identifiable, Codable {
    var id: String = UUID().uuidString //  give random id
    let title: String
    let isCompleted: Bool
    
    // initizlier where you can add the id if you want
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    // opposite of is completed
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}

