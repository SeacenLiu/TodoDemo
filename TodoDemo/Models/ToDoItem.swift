//
//  ToDoItem.swift
//  TodoDemo
//
//  Created by SeacenLiu on 2018/5/23.
//  Copyright © 2018年 成. All rights reserved.
//

import Foundation

struct ToDoItem {
    let id: UUID
    let title: String
    
    init(title: String) {
        self.id = UUID()
        self.title = title
    }
}
