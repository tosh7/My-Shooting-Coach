//
//  HomeViewController.swift
//  MyShootingCoach
//
//  Created by Satoshi Komatsu on 2017/09/25.
//  Copyright © 2017年 Satoshi Komatsu. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController{
    
    @IBOutlet weak var startDay: UILabel!
    @IBOutlet weak var endDay: UILabel!
    @IBOutlet weak var shootPercent: UILabel!
    let realm = try! Realm()
    var min:Int = 1232
    var max:Int = 100
    var totalMake:Int = 0
    var totalTake:Int = 0
    var shootDataArray: Results<ShootData>!
    
    let po = ShootData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        /*po.month = 1
         po.day = 0
         po.make = 0
         po.take = 0
         po.percent = 0
         po.area = "Z"
         
         print(Realm.Configuration.defaultConfiguration.fileURL!)
         
         let realm = try! Realm()
         try! realm.write{
         realm.add(po)
         }*/
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //        let realm = try! Realm()
        
        shootDataArray = realm.objects(ShootData.self)
        
        if shootDataArray.count != 0{
            calcu()
        }
        
        
        startDay.text  = "\(min / 100)/\(min % 100)"
        endDay.text  = "\(max / 100)/\(max % 100)"
        if totalTake != 0{
            shootPercent.text = "\(totalMake * 100 / totalTake)"
        } else {
            shootPercent.text = "0"
        }
        
    }
    
    func calcu(){
        
        for i in 0...shootDataArray.count - 1{
            print("iは\(i)である")
            let monthDate:Int = shootDataArray[i].month * 100 + shootDataArray[i].day
            
            
            
            if min >= monthDate && monthDate != 100{
                min = monthDate
            }
            
            if max <= monthDate{
                max = monthDate
            }
            
            totalMake = totalMake + shootDataArray[i].make
            totalTake = totalTake + shootDataArray[i].take
            
        }
        
    }
    
}
