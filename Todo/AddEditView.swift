import SwiftUI

struct AddEditView: View {
    @ObservedObject var viewModel: TodoViewModel
    @Binding var item: TodoItem?
    @State private var title: String = ""
    @State private var isCompleted: Bool = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                Toggle("Completed", isOn: $isCompleted)
            }
            .navigationTitle(item == nil ? "Add Item" : "Edit Item")
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Save") {
                if let item = item {
                    viewModel.updateItem(id: item.id, title: title, isCompleted: isCompleted)
                } else {
                    viewModel.addItem(title: title)
                }
                presentationMode.wrappedValue.dismiss()
            })
            .onAppear {
                if let item = item {
                    title = item.title
                    isCompleted = item.isCompleted
                }
            }
        }
    }
}
