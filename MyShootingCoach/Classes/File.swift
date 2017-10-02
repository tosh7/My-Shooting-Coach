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
    
    @objc dynamic var month: Int = 0
    @objc dynamic var day: Int = 0
    @objc dynamic var take: Int = 0
    @objc dynamic var make: Int = 0
    @objc dynamic var percent: Double = 0
    
}
