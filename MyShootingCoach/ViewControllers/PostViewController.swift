//
//  PostViewController.swift
//  MyShootingCoach
//
//  Created by Satoshi Komatsu on 2017/09/25.
//  Copyright © 2017年 Satoshi Komatsu. All rights reserved.
//

import UIKit
import RealmSwift

class PostViewController: UIViewController {
    
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var makeTextField: UITextField!
    @IBOutlet weak var takeTextField: UITextField!
    
    let po = ShootData()
    
    @IBAction func Post(_ sender: Any) {
        
        let dataMake = Double(makeTextField.text!)!
        let dataTake = Double(takeTextField.text!)!
        
        po.month = Int(monthTextField.text!)!
        po.day = Int(dayTextField.text!)!
        po.make = Int(makeTextField.text!)!
        po.take = Int(takeTextField.text!)!
        po.percent = dataMake / dataTake * 100
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        let realm = try! Realm()
        try! realm.write{
            realm.add(po)
        }
        
        let alert: UIAlertController = UIAlertController(title: "保存",
                                                         message: "データの入力が完了しました",
                                                         preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,
                                      handler: { action in
                                        print("OKボタンが押されました")
                                        self.dismiss(animated: true, completion: nil)
                                    }
                        )
        )
        
        present(alert, animated: true, completion: nil)
    }
    
}
