//
//  TodoViewModel.swift
//  Todo
//
//  Created by Pham Thi Thanh Thuy on 11/06/2024.
//

import Foundation

class TodoViewModel: ObservableObject {
    @Published var items: [TodoItem] = []

    func addItem(title: String) {
        let newItem = TodoItem(title: title, isCompleted: false)
        items.append(newItem)
    }

    func updateItem(id: UUID, title: String, isCompleted: Bool) {
        if let index = items.firstIndex(where: { $0.id == id }) {
            items[index].title = title
            items[index].isCompleted = isCompleted
        }
    }

    func deleteItem(id: UUID) {
        items.removeAll { $0.id == id }
    }
}
