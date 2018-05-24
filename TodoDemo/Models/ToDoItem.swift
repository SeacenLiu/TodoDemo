//
//  ToDoItem.swift
//  TodoDemo
//
//  Created by SeacenLiu on 2018/5/23.
//  Copyright © 2018年 成. All rights reserved.
//

import Foundation

struct ToDoItem {
    
    typealias ItemId = UUID
    
    let id: ItemId
    let title: String
    
    init(title: String) {
        self.id = ItemId()
        self.title = title
    }
}

extension ToDoItem: Hashable {
    var hashValue: Int {
        return id.hashValue
    }
}

extension ToDoItem: Equatable {
    static func ==(lhs: ToDoItem, rhs: ToDoItem) -> Bool {
        return lhs.id == rhs.id
    }
}
