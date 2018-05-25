//
//  ToDoItem.swift
//  TodoDemo
//
//  Created by SeacenLiu on 2018/5/23.
//  Copyright © 2018年 成. All rights reserved.
//

import Foundation

struct ToDoItem {
    
    enum ChangeBehavior {
        case fixTitle(String)
    }
    
    typealias ItemId = UUID
    
    let id: ItemId
    var title: String {
        didSet {
            postNotification(behavior: .fixTitle(title))
        }
    }
    
    init(title: String) {
        self.id = ItemId()
        self.title = title
    }
    
    private func postNotification(behavior: ChangeBehavior) {
        NotificationCenter.default.post(
            name: .toDoItemDidChangedNotification,
            object: self,
            typedUserInfo: [.toDoItemDidChangedChangeBehaviorKey: behavior])
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
