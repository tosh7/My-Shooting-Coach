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
    
    @IBOutlet weak var month: UITextField!
    @IBOutlet weak var day: UITextField!
    @IBOutlet weak var make: UITextField!
    @IBOutlet weak var take: UITextField!
    
    let po = ShootData()
    
    @IBAction func Post(_ sender: Any) {
        
        po.month = Int(month.text!)!
        po.day = Int(day.text!)!
        po.take = Int(make.text!)!
        po.make = Int(take.text!)!
        
        let data_make = Double(make.text!)!
        let data_take = Double(take.text!)!
        
        po.percent = data_make / data_take * 100
        
        print("data_make is ", data_make)
        print("data_take is ", data_take)
        print("po.percent is ", po.percent)
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        let realm = try! Realm()
        try! realm.write{
            realm.add(po)
        }
        
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
