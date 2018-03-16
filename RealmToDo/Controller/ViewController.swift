//
//  ViewController.swift
//  RealmToDo
//
//  Created by 真田雄太 on 2018/03/16.
//  Copyright © 2018年 yutaSanada. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UITableViewController {
    
    let realm = try! Realm()
    
    var todos: Results<ToDoItem>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellIdentifier")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count //todoの数分セルを返す
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath as IndexPath) as UITableViewCell
        
        let todoItem = todos[indexPath.row].name //現在のセルのインデックスを取得しデータベースから対応するオブジェクトをフェッチ
        cell.textLabel?.text = todoItem //取り込んだtodoItemの名前をセルの名前に設定
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

