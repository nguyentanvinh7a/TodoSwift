import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TodoViewModel()
    @State private var showingAddEditView = false
    @State private var selectedItem: TodoItem?

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.items) { item in
                    HStack {
                        Text(item.title)
                        Spacer()
                        if item.isCompleted {
                            Image(systemName: "checkmark")
                        }
                    }
                    .onTapGesture {
                        selectedItem = item
                        showingAddEditView = true
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Todo List")
            .navigationBarItems(trailing: Button(action: {
                selectedItem = nil
                showingAddEditView = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingAddEditView) {
                AddEditView(viewModel: viewModel, item: $selectedItem)
            }
        }
    }

    private func deleteItems(at offsets: IndexSet) {
        offsets.map { viewModel.items[$0].id }.forEach(viewModel.deleteItem)
    }
}
