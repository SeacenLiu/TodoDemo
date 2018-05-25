//
//  ToDoEditViewController.swift
//  TodoDemo
//
//  Created by SeacenLiu on 2018/5/24.
//  Copyright © 2018年 成. All rights reserved.
//

import UIKit

class ToDoEditViewController: UIViewController {

    @IBOutlet weak var titleView: UITextField!
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    
    lazy var toDoItem: ToDoItem = ToDoStore.shared.item(at: ToDoStore.shared.selectedIndex!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = toDoItem.title
        titleView.text = toDoItem.title

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(toDoItemDidChange(notification:)),
            name: .toDoItemDidChangedNotification,
            object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func toDoItemDidChange(notification: Notification) {
        let behavior = notification.getUserInfo(for: .toDoItemDidChangedChangeBehaviorKey)
        switch behavior {
        case .fixTitle(let newTitle):
            title = newTitle
        }
        saveBtn.isEnabled = true
    }

    @IBAction func titleTextFieldDidChange(_ sender: UITextField) {
        toDoItem.title = sender.text!
    }
    
    @IBAction func saveClick(_ sender: Any) {
        let new = ToDoItem(title: titleView.text ?? "")
        ToDoStore.shared.edit(original: toDoItem, new: new)
        
        navigationController?.popViewController(animated: true)
    }
    
}
