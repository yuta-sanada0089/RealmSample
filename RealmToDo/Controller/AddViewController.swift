//
//  AddViewController.swift
//  RealmToDo
//
//  Created by 真田雄太 on 2018/03/16.
//  Copyright © 2018年 yutaSanada. All rights reserved.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField?
    var newItemText: String?
    
    var realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        setupTextField()
        setupNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textField?.becomeFirstResponder()
    }//ファーストレスポンダになるための設定。ビューが表示した直後にtextFieldに伝える。
    
    func setupTextField() {
        textField = UITextField(frame: CGRectZero)//初期化
        textField?.placeholder = "Type in item"//placeholderの設定
        textField?.delegate = self //delegateも設定.リターンキーを押すタイミングを知るために必要
        view.addSubview(textField!)
    }//textFieldの設定

    func setupNavigationBar(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: "doneAction")
    }//完了ボタンを右のバーボタンとして追加
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let padding = CGFloat(11)
        textField?.frame = CGRect(padding, self.topLayoutGuide.length + 50, view.frame.size.width - padding * 2, 100)
    }//textfieldの枠の設定
    
    func doneAction() {
        if self.textField?.text?.utf16Count > 0 {
            let newTodoItem = ToDoItem() //ToDoItemを取得
            newTodoItem.name = self.textField!.text! //入力したテキスト
            realm.write {
                realm.add(newTodoItem)
            }//新しく生成されたToDoitemをrealmに追加
        }//テキストを確認、空なら閉じる。
        self.dismiss(animated: true, completion: nil) //リストに戻る
    }//入力されたテキストをチェックしデータベースに書き込むメソッド
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        doneAction()
        textField.resignFirstResponder()
        return true
    }//リターンキーを押した時のtextFieldのコールバック。doneActionを呼んでいる。

}
