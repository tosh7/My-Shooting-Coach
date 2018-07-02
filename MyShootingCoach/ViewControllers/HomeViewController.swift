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
//    var min:Int = 1232
//    var max:Int = 100
    var totalMake:Int = 0
    var totalTake:Int = 0
    var shootDataArray: Results<ShootData>!
    
    let po = ShootData()
    //    var realm: Realm!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let folderPath = realm.configuration.fileURL!.deletingLastPathComponent().path
        print(folderPath)
        shootDataArray = realm.objects(ShootData.self)
        
//        if shootDataArray.count != 0{
//            calcu()
//
//
//            startDay.text  = "\(min / 100)/\(min % 100)"
//            endDay.text  = "\(max / 100)/\(max % 100)"
//
//
//            shootPercent.text = "\(totalMake * 100 / totalTake)"
//
//        }else {
            startDay.text = "1/1"
            endDay.text = "1/1"
            shootPercent.text = "0"
//        }
    }
    
//    func calcu(){
//
//        for i in 0...shootDataArray.count - 1{
//            let monthDate:Int = shootDataArray[i].month * 100 + shootDataArray[i].day
//
//            if min >= monthDate && monthDate != 100{
//                min = monthDate
//            }
//
//            if max <= monthDate{
//                max = monthDate
//            }
//
//            totalMake = totalMake + shootDataArray[i].make
//            totalTake = totalTake + shootDataArray[i].take
//        }
//    }
}
