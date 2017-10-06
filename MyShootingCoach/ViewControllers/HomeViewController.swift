//
//  HomeViewController.swift
//  MyShootingCoach
//
//  Created by Satoshi Komatsu on 2017/09/25.
//  Copyright © 2017年 Satoshi Komatsu. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    
    @IBOutlet weak var startDay: UILabel!
    @IBOutlet weak var endDay: UILabel!
    @IBOutlet weak var shootPercent: UILabel!
    let realm = try! Realm()
    var min:Int = 1232
    var max:Int = 100
    var totalMake:Int = 0
    var totalTake:Int = 0
    var shootDataArray: Results<ShootData>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shootDataArray = realm.objects(ShootData.self)
        
        calcu()
        
        startDay.text  = "\(min / 100)/\(min % 100)"
        endDay.text  = "\(max / 100)/\(max % 100)"
        shootPercent.text = "\(totalMake * 100 / totalTake)"
        
    }
    
    func calcu(){
        
        for i in 0...shootDataArray.count - 1{
            print("iは\(i)である")
            let monthDate:Int = shootDataArray[i].month * 100 + shootDataArray[i].day
            
            if min >= monthDate{
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
