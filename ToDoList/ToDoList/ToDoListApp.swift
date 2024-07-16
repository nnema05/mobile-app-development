//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Nandini Nema on 6/27/24.
//

import SwiftUI

@main
struct ToDoListApp: App {
    // want to observe this obejct view model so that when this changes our class knows the view model changes by making it a stat object and make the view model an observable object
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            // wrap everything in a navigation view
            NavigationView {
                // first screen in our app
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle()) // for ipad view
            .environmentObject(listViewModel)
            
        }
    }
}
