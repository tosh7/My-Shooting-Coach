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
    
    @objc dynamic var day: String = ""
    @objc dynamic var take: Int = 0
    @objc dynamic var make: Int = 0
    
}
