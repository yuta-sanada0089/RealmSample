//
//  ToDoItem.swift
//  RealmToDo
//
//  Created by 真田雄太 on 2018/03/16.
//  Copyright © 2018年 yutaSanada. All rights reserved.
//
import Realm
import RealmSwift

class ToDoItem: Object {
    @objc dynamic var name = ""
    @objc dynamic var finished = false
}
