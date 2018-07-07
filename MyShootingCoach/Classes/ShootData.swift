//
//  File.swift
//  MyShootingCoach
//
//  Created by Satoshi Komatsu on 2017/09/25.
//  Copyright © 2017年 Satoshi Komatsu. All rights reserved.
//

import UIKit
import RealmSwift

class ShootData: Object{
    
    @objc dynamic var practiceDay = Date()
    @objc dynamic var take = 0
    @objc dynamic var make = 0
    @objc dynamic var percent: Double = 0.0
    @objc dynamic var area = ""
    
}
