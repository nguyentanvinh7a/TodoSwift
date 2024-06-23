//
//  TodoItem.swift
//  Todo
//
//  Created by Pham Thi Thanh Thuy on 11/06/2024.
//

import Foundation

struct TodoItem: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted: Bool
}
