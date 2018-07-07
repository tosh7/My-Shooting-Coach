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
    
    
    @IBOutlet weak var makeTextField: UITextField!
    @IBOutlet weak var takeTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var aButtonText: UIButton!
    @IBOutlet weak var bButtonText: UIButton!
    @IBOutlet weak var cButtonText: UIButton!
    @IBOutlet weak var dButtonText: UIButton!
    @IBOutlet weak var eButtonText: UIButton!
    @IBOutlet weak var fButtonText: UIButton!
    @IBOutlet weak var gButtonText: UIButton!
    @IBOutlet weak var hButtonText: UIButton!
    @IBOutlet weak var iButtonText: UIButton!
    
    let po = ShootData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func Post(_ sender: Any) {
        
        let dataMake = Double(makeTextField.text!)!
        let dataTake = Double(takeTextField.text!)!
        let date = datePicker.date
        
        po.practiceDay = date;
        po.make = Int(makeTextField.text!)!
        po.take = Int(takeTextField.text!)!
        po.percent = dataMake / dataTake * 100
        
        let realm = try! Realm()
        if (po.make > po.take){
            let lieAlert = UIAlertView()
            lieAlert.title = "警告"
            lieAlert.message = "成功数が試投数を超えています"
            lieAlert.addButton(withTitle: "OK")
            lieAlert.show()
        } else if(po.make != 0 && po.take != 0 && po.area != nil) {
            
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
        } else {
            let nilAlert = UIAlertView()
            nilAlert.title = "警告"
            nilAlert.message = "空白があります"
            nilAlert.addButton(withTitle: "OK")
            nilAlert.show()
        }
        
        
    }
    
    @IBAction func aButton(){
        aButtonText.setTitleColor(UIColor.red, for: .normal)
        po.area = "A"
    }
    
    @IBAction func bButton(){
        bButtonText.setTitleColor(UIColor.red, for: .normal)
        po.area = "B"
    }
    
    @IBAction func cButton(_ sender: Any) {
        cButtonText.setTitleColor(UIColor.red, for: .normal)
        po.area = "C"
    }
    
    @IBAction func dButton(){
        dButtonText.setTitleColor(UIColor.red, for: .normal)
        po.area = "D"
    }
    
    @IBAction func eButton(){
        eButtonText.setTitleColor(UIColor.red, for: .normal)
        po.area = "E"
    }
    
    @IBAction func fButton(){
        fButtonText.setTitleColor(UIColor.red, for: .normal)
        po.area = "F"
    }
    
    @IBAction func gButton(){
        gButtonText.setTitleColor(UIColor.red, for: .normal)
        po.area = "G"
    }
    
    @IBAction func hButton(){
        hButtonText.setTitleColor(UIColor.red, for: .normal)
        po.area = "H"
    }
    
    @IBAction func iButton(){
        iButtonText.setTitleColor(UIColor.red, for: .normal)
        po.area = "I"
    }
}
