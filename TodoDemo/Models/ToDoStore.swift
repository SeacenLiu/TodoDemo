//
//  ToDoStore.swift
//  TodoDemo
//
//  Created by SeacenLiu on 2018/5/23.
//  Copyright © 2018年 成. All rights reserved.
//

import Foundation


class ToDoStore {
    
    enum ChangeBehavior {
        case add([Int])
        case remove([Int])
        case reload
    }
    
    static let shared = ToDoStore()
    
    public var selectedIndex: Int?
    
    private var items: [ToDoItem] = [] {
        didSet {
            let behavior = ToDoStore.diff(original: oldValue, now: items)
            NotificationCenter.default.post(
                name: .toDoStoreDidChangedNotification,
                object: self,
                typedUserInfo: [.toDoStoreDidChangedChangeBehaviorKey: behavior])
        }
    }
    
    static func diff(original: [ToDoItem], now: [ToDoItem]) -> ChangeBehavior {
        let originalSet = Set(original)
        let nowSet = Set(now)
        
        if originalSet.isSubset(of: nowSet) { // Append
            let added = nowSet.subtracting(originalSet)
            let indexes = added.compactMap{now.index(of: $0)}
            return .add(indexes)
        } else if nowSet.isSubset(of: originalSet) { // Remove
            let removed = originalSet.subtracting(nowSet)
            let indexes = removed.compactMap{ original.index(of: $0) }
            return .remove(indexes)
        } else { // Both appended and removed
            return .reload
        }
    }
    
    private init() {}

    func append(item: ToDoItem) {
        items.append(item)
    }
    
    func append(newItems: [ToDoItem]) {
        items.append(contentsOf: newItems)
    }
    
    func remove(item: ToDoItem) {
        guard let index = items.index(of: item) else { return }
        remove(at: index)
    }
    
    func remove(at index: Int) {
        items.remove(at: index)
    }
    
    func edit(original: ToDoItem, new: ToDoItem) {
        guard let index = items.index(of: original) else { return }
        items[index] = new
    }
    
    func edit(index: Int, new: ToDoItem) {
        items[index] = new
    }
    
    var count: Int {
        return items.count
    }
    
    func item(at index: Int) -> ToDoItem {
        return items[index]
    }
    
    func select(at index: Int) {
        selectedIndex = index
    }
}


