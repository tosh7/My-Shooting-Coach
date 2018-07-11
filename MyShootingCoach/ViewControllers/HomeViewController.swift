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
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let folderPath = realm.configuration.fileURL!.deletingLastPathComponent().path
        print(folderPath)
        shootDataArray = realm.objects(ShootData.self)
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMMd")
        
        if shootDataArray.count != 0{
            calcu()
        }else {
            startDay.text = "1/1"
            endDay.text = "1/1"
            shootPercent.text = "0"
        }
    }
    
    func calcu(){
        
        let po = shootDataArray.sorted(byKeyPath: "practiceDay")
        startDay.text = dateFormatter.string(from: po[0].practiceDay)
        endDay.text = dateFormatter.string(from: po[po.count-1].practiceDay)
        
        for i in 0...shootDataArray.count - 1{
            totalMake = totalMake + shootDataArray[i].make
            totalTake = totalTake + shootDataArray[i].take
        }
        shootPercent.text = String(totalMake * 100 / totalTake)
    }
}
