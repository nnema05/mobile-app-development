//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Nandini Nema on 7/6/24.
//

/*
 CRUD FUNCTION
 Cretae
 Read
 Update
 Delete
 */

import Foundation

class ListViewModel: ObservableObject {
    // make list ivew model into an enviorment object
    
    
    // data array of items models for list items (has to be published because its in a view model)
    @Published var items: [ItemModel] = [] {
        // add computed property (with did set), gets called every time you cahnge the items array
            // everytime you change the items array you want to call save items
        didSet {
            saveItems()
        }
    }
    
    // make an items key for function save items
    let itemsKey: String = "items_list"
    
    init () {
        getItems()
    }
    
    // getter for new items which creates items and appends them
    func getItems() {
        
        // get items from user defaults
            // data AND saved items is optional because tehre is a chance there is no data so include a guard
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
        // now convert data from data json to an item model
            // want to make an array of item models (use .self to make it a type of item model)
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    // move item, from where its coming from (indicies) and where its moving to (newOffset)
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    // function that takes in a title as a string, makes it an item model and appends it to items
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
//                if let index = items.firstIndex { (existingItem) -> Bool in
//                    return existingItem.id == item.id
//                    
//                } {
//                    // run this code
//                }
        
        // $0 is existing item (what we are looping on
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
        
    }
    
    // how to save items with user defaults
    // convert all of these items to JSON data
    func saveItems() {
        // try to encode items array
        if let encodedData = try? JSONEncoder().encode(items) {
            // set the encoded data as user defaults (need a key for user defaults (forKey))
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}

