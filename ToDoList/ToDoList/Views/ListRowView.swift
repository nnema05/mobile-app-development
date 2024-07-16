//
//  ListRowView.swift
//  ToDoList
//
//  Created by Nandini Nema on 6/27/24.
//

import SwiftUI

// adds image and item in each row
struct ListRowView: View {
    // make title dunamic of the list
    // now we changed it to item model
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}


struct ListRowView_Preview: PreviewProvider {
    
    static var item1 = ItemModel(title: "First Item", isCompleted: false)
    static var item2 = ItemModel(title: "Second Item", isCompleted: true)
   
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
    }
    
}
