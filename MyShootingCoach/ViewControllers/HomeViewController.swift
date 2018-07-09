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
    var totalMake:Int = 0
    var totalTake:Int = 0
    var shootDataArray: Results<ShootData>!
//    let po = ShootData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let folderPath = realm.configuration.fileURL!.deletingLastPathComponent().path
        print(folderPath)
        shootDataArray = realm.objects(ShootData.self)
        
        
        
        if shootDataArray.count != 0{
//            print(shootDataArray[0].practiceDay)
//            calcu()
            let po = shootDataArray.sorted(byKeyPath: "practiceDay")
            for i in 0...po.count - 1 {
                print(po[i].practiceDay)
            }
//            shootPercent.text = "\(totalMake * 100 / totalTake)"

        }else {
            startDay.text = "1/1"
            endDay.text = "1/1"
            shootPercent.text = "0"
        }
    }
    
    func calcu(){

        for i in 0...shootDataArray.count - 1{
//            let monthDate:Int = shootDataArray[i].month * 100 + shootDataArray[i].day
//
//            if min >= monthDate && monthDate != 100{
//                min = monthDate
//            }
//
//            if max <= monthDate{
//                max = monthDate
//            }

            totalMake = totalMake + shootDataArray[i].make
            totalTake = totalTake + shootDataArray[i].take
        }
    }
}
