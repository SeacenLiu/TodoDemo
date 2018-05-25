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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let index = ToDoStore.shared.selectedIndex {
            let item = ToDoStore.shared.item(at: index)
            titleView.text = item.title
        } else {
            titleView.text = "空"
            titleView.isUserInteractionEnabled = false
        }

        //        NotificationCenter.default.addObserver(self, selector: <#T##Selector#>, name: <#T##NSNotification.Name?#>, object: <#T##Any?#>)
    }

    @IBAction func saveClick(_ sender: Any) {
        
    }
    
}
