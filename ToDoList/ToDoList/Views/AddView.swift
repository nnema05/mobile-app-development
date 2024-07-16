//
//  AddView.swift
//  ToDoList
//
//  Created by Nandini Nema on 6/27/24.
//

import SwiftUI

// VIew when a user clicks on add view
struct AddView: View {
    // to go back you an use presentation model
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    // alerts
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here ...", text: $textFieldText )
                    .padding(.horizontal)
                    .frame(height: 55)
                // system UI colors are automatically dynamic to light and dark mode
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                // save button
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
            
        }
        .navigationTitle("Add an Item 🖋️")
        .alert(isPresented: $showAlert, content: getAlert)
        
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            // tell presentation mode to go back one in view heichry
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo must be at least 3 characters long"
            // make show alert true
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    Group {
        NavigationView {
            AddView()
        }
        .preferredColorScheme(.light)
        .environmentObject(ListViewModel())
        NavigationView {
            AddView()
        }
        .preferredColorScheme(.dark)
        .environmentObject(ListViewModel())

        
    }
    
}
