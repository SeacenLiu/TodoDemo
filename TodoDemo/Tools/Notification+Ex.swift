//
//  Notification+Ex.swift
//  TodoDemo
//
//  Created by SeacenLiu on 2018/5/25.
//  Copyright © 2018年 成. All rights reserved.
//

import Foundation

extension Notification {
    struct UserInfoKey<ValueType>: Hashable {
        let key: String
    }
    
    func getUserInfo<T>(for key: Notification.UserInfoKey<T>) -> T {
        return userInfo![key] as! T
    }
}

extension NotificationCenter {
    func post<T>(name aName: NSNotification.Name, object anObject: Any?, typedUserInfo aUserInfo: [Notification.UserInfoKey<T> : T]? = nil) {
        post(name: aName, object: anObject, userInfo: aUserInfo)
    }
}

extension Notification.Name {
    static let toDoStoreDidChangedNotification = Notification.Name(rawValue: "com.seacen.app.ToDoStoreDidChangedNotification")
    
    static let toDoItemDidChangedNotification = Notification.Name(rawValue: "com.seacen.app.ToDoItemDidChangedNotification")
}

extension Notification.UserInfoKey {
    static var toDoStoreDidChangedChangeBehaviorKey: Notification.UserInfoKey<ToDoStore.ChangeBehavior> {
        return Notification.UserInfoKey(key: "com.seacen.app.ToDoStoreDidChangedNotification.ChangeBehavior")
    }
    
    static var toDoItemDidChangedChangeBehaviorKey: Notification.UserInfoKey<ToDoItem.ChangeBehavior> {
        return Notification.UserInfoKey(key: "com.seacen.app.ToDoItemDidChangedNotification.ChangeBehavior")
    }
}
