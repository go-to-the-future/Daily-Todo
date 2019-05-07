//
//  TuesdayController.swift
//  Todo3
//
//  Created by Kiyoto Ryuman on 2019/04/07.
//  Copyright © 2019 Kiyoto Ryuman. All rights reserved.
//

import UIKit
protocol TuesdayControllerDelegate {
    func updateTableView()
}
//classの継承を追加
class TuesdayController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var addButton: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
   
    //UITableView、numberOfRowsInSectionの追加(表示するcell数を決める)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //戻り値の設定(表示するcell数)
        return AddController.tuesdayContent.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    //UITableView、cellForRowAtの追加(表示するcellの中身を決める)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //変数を作る
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "tuesday", for: indexPath)
        //変数の中身を作る
        TodoCell.textLabel!.text = AddController.tuesdayContent[indexPath.row]
        //戻り値の設定（表示する中身)
        return TodoCell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteButton: UITableViewRowAction = UITableViewRowAction(style: .normal, title: "削除") { (action, index) -> Void in
            AddController.tuesdayContent.remove(at: indexPath.row)
            UserDefaults.standard.removeObject(forKey: "tuesday")
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        deleteButton.backgroundColor = UIColor.red
        let editButton:UITableViewRowAction = UITableViewRowAction(style: .normal, title: "編集") { (action, index) -> Void in
            AddController.tuesdayContent.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        editButton.backgroundColor = UIColor.gray
        return [deleteButton, editButton]
    }
    func updateTableView() {
        self.tableView.reloadData()
    }
    //最初からあるコード
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapA: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(filterButtonTap))
        self.label.isUserInteractionEnabled = true
        self.label.addGestureRecognizer(tapA)
        
        let tapB: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addTodo))
        self.addButton.isUserInteractionEnabled = true
        self.addButton.addGestureRecognizer(tapB)
            
            
        if UserDefaults.standard.object(forKey: "tuesday") != nil {
            AddController.tuesdayContent = UserDefaults.standard.object(forKey: "tuesday") as! [String]
        }
    }
    @objc func addTodo(){
        let storyboard: UIStoryboard = self.storyboard!
        //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
        let add = storyboard.instantiateViewController(withIdentifier: "add")
        AddController.sendNumber = 2
        //ここが実際に移動するコードとなります
        add.modalTransitionStyle = .coverVertical
        self.present(add, animated: false, completion: nil)
    }
    @objc func filterButtonTap(){
        let alert: UIAlertController = UIAlertController(title: "曜日", message: .none, preferredStyle:  UIAlertController.Style.alert)
        var titleName:[String] = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
        
        let defaultAction: UIAlertAction = UIAlertAction(title: titleName[0], style: UIAlertAction.Style.default, handler:{
            (action: UIAlertAction!) -> Void in
            //タップされた時の処理を書く
            //まずは、同じstororyboard内であることをここで定義します
            let storyboard: UIStoryboard = self.storyboard!
            //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
            let monday = storyboard.instantiateViewController(withIdentifier: "monday")
            monday.modalTransitionStyle = .flipHorizontal
            //ここが実際に移動するコードとなります
            self.present(monday, animated: true, completion: nil)
        })
        
        let defaultAction1: UIAlertAction = UIAlertAction(title: titleName[1], style: UIAlertAction.Style.default, handler:{
            (action: UIAlertAction!) -> Void in
            //タップされた時の処理を書く
            //まずは、同じstororyboard内であることをここで定義します
            let storyboard: UIStoryboard = self.storyboard!
            //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
            let tuesday = storyboard.instantiateViewController(withIdentifier: "tuesday")
            //ここが実際に移動するコードとなります
            tuesday.modalTransitionStyle = .flipHorizontal
            self.present(tuesday, animated: true, completion: nil)
        })
        let defaultAction2: UIAlertAction = UIAlertAction(title: titleName[2], style: UIAlertAction.Style.default, handler:{
            (action: UIAlertAction!) -> Void in
            //タップされた時の処理を書く
            //まずは、同じstororyboard内であることをここで定義します
            let storyboard: UIStoryboard = self.storyboard!
            //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
            let wednesday = storyboard.instantiateViewController(withIdentifier: "wednesday")
            //ここが実際に移動するコードとなります
            wednesday.modalTransitionStyle = .flipHorizontal
            self.present(wednesday, animated: true, completion: nil)
        })
        let defaultAction3: UIAlertAction = UIAlertAction(title: titleName[3], style: UIAlertAction.Style.default, handler:{
            (action: UIAlertAction!) -> Void in
            //タップされた時の処理を書く
            //まずは、同じstororyboard内であることをここで定義します
            let storyboard: UIStoryboard = self.storyboard!
            //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
            let thursday = storyboard.instantiateViewController(withIdentifier: "thursday")
            //ここが実際に移動するコードとなります
            thursday.modalTransitionStyle = .flipHorizontal
            self.present(thursday, animated: true, completion: nil)
        })
        let defaultAction4: UIAlertAction = UIAlertAction(title: titleName[4], style: UIAlertAction.Style.default, handler:{
            (action: UIAlertAction!) -> Void in
            //タップされた時の処理を書く
            //まずは、同じstororyboard内であることをここで定義します
            let storyboard: UIStoryboard = self.storyboard!
            //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
            let friday = storyboard.instantiateViewController(withIdentifier: "friday")
            //ここが実際に移動するコードとなります
            friday.modalTransitionStyle = .flipHorizontal
            self.present(friday, animated: true, completion: nil)
        })
        let defaultAction5: UIAlertAction = UIAlertAction(title: titleName[5], style: UIAlertAction.Style.default, handler:{
            (action: UIAlertAction!) -> Void in
            //タップされた時の処理を書く
            //まずは、同じstororyboard内であることをここで定義します
            let storyboard: UIStoryboard = self.storyboard!
            //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
            let saturday = storyboard.instantiateViewController(withIdentifier: "saturday")
            //ここが実際に移動するコードとなります
            saturday.modalTransitionStyle = .flipHorizontal
            self.present(saturday, animated: true, completion: nil)
        })
        let defaultAction6: UIAlertAction = UIAlertAction(title: titleName[6], style: UIAlertAction.Style.default, handler:{
            (action: UIAlertAction!) -> Void in
            //タップされた時の処理を書く
            //まずは、同じstororyboard内であることをここで定義します
            let storyboard: UIStoryboard = self.storyboard!
            //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
            let sunday = storyboard.instantiateViewController(withIdentifier: "sunday")
            //ここが実際に移動するコードとなります
            sunday.modalTransitionStyle = .flipHorizontal
            self.present(sunday, animated: true, completion: nil)
        })
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler:{
            (action: UIAlertAction!) -> Void in
            //タップされた時の処理を書く
        })
        
        alert.addAction(defaultAction)
        alert.addAction(defaultAction1)
        alert.addAction(defaultAction2)
        alert.addAction(defaultAction3)
        alert.addAction(defaultAction4)
        alert.addAction(defaultAction5)
        alert.addAction(defaultAction6)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}
