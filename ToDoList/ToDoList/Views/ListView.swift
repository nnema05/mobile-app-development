import SwiftUI

// main list view
struct ListView: View {
    // now call at enviorment object to get in list ivew model
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity
                        .animation(.easeIn))
            } else {
                // add item in a list
                List {
                    ForEach(listViewModel.items) { item in
                        
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    } // remove list items
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                    
                    
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List📝")
        // bar items!
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
            )
    }
    
    
}

#Preview {
    // want our preview to be inside a navigation view
    NavigationView {
        ListView()
    }
    .environmentObject(ListViewModel())

}


