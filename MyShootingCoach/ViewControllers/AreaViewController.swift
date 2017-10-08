//
//  AreaViewController.swift
//  MyShootingCoach
//
//  Created by Satoshi Komatsu on 2017/09/25.
//  Copyright © 2017年 Satoshi Komatsu. All rights reserved.
//

import UIKit
import RealmSwift

class AreaViewController: UIViewController {
    
    @IBOutlet weak var threeLeftCorner: UILabel!
    @IBOutlet weak var threeLeftWing: UILabel!
    @IBOutlet weak var threeCenter: UILabel!
    @IBOutlet weak var threeRightWing: UILabel!
    @IBOutlet weak var threeRightCorner: UILabel!
    @IBOutlet weak var left: UILabel!
    @IBOutlet weak var middle: UILabel!
    @IBOutlet weak var right: UILabel!
    @IBOutlet weak var paintArea: UILabel!
    
    var takeTotalArray: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var makeTotalArray: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var percentTotalArray: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let realm = try! Realm()
    var shootDataArray: Results<ShootData>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shootDataArray = realm.objects(ShootData.self)
        print(2)
        
        cluc()
        put()
        check()
        
    }
    
    func cluc(){
        
        for i in 0...shootDataArray.count - 1 {
            switch shootDataArray[i].area{
            case "A":
                takeTotalArray[0] = takeTotalArray[0] + shootDataArray[i].take
                makeTotalArray[0] = makeTotalArray[0] + shootDataArray[i].make
                print("a =\(takeTotalArray[0])")
                print("a =\(makeTotalArray[0])")
                
            case "B":
                takeTotalArray[1] = takeTotalArray[1] + shootDataArray[i].take
                makeTotalArray[1] = makeTotalArray[1] + shootDataArray[i].make
                print("b")
                
            case "C":
                takeTotalArray[2] = takeTotalArray[2] + shootDataArray[i].take
                makeTotalArray[2] = makeTotalArray[2] + shootDataArray[i].make
                
            case "D":
                takeTotalArray[3] = takeTotalArray[3] + shootDataArray[i].take
                makeTotalArray[3] = makeTotalArray[3] + shootDataArray[i].make
                
            case "E":
                takeTotalArray[4] = takeTotalArray[4] + shootDataArray[i].take
                makeTotalArray[4] = makeTotalArray[4] + shootDataArray[i].make
                
            case "F":
                takeTotalArray[5] = takeTotalArray[5] + shootDataArray[i].take
                makeTotalArray[5] = makeTotalArray[5] + shootDataArray[i].make
                
            case "G":
                takeTotalArray[6] = takeTotalArray[6] + shootDataArray[i].take
                makeTotalArray[6] = makeTotalArray[6] + shootDataArray[i].make
                
            case "H":
                takeTotalArray[7] = takeTotalArray[7] + shootDataArray[i].take
                makeTotalArray[7] = makeTotalArray[7] + shootDataArray[i].make
                
            case "I":
                takeTotalArray[8] = takeTotalArray[8] + shootDataArray[i].take
                makeTotalArray[8] = makeTotalArray[8] + shootDataArray[i].make
                
            case "Z":
                print("test")
                
            default:
                break
            }
        }
            
        for j in 0...8{
            percentTotalArray[j] = makeTotalArray[j] *  100 / takeTotalArray[j]
        }
    }
    
    func put(){
        threeLeftCorner.text = "\(percentTotalArray[0])%"
        threeLeftWing.text = "\(percentTotalArray[1])%"
        threeCenter.text = "\(percentTotalArray[2])%"
        threeRightWing.text = "\(percentTotalArray[3])%"
        threeRightCorner.text = "\(percentTotalArray[4])%"
        left.text = "\(percentTotalArray[5])%"
        middle.text = "\(percentTotalArray[6])%"
        paintArea.text = "\(percentTotalArray[7])%"
        right.text = "\(percentTotalArray[8])%"
    }
    
    func check(){
        
        if percentTotalArray[0] >= 75{
            bluePaint(tag: threeLeftCorner)
        }else if percentTotalArray[0] < 75 && percentTotalArray[0] >= 50{
            greenPaint(tag: threeLeftCorner)
        }else if percentTotalArray[0] < 50 && percentTotalArray[0] >= 25{
            orangePaint(tag: threeLeftCorner)
        }else if percentTotalArray[0] < 25{
            redPaint(tag: threeLeftCorner)
        }
        
        if percentTotalArray[1] >= 75{
            bluePaint(tag: threeLeftWing)
        }else if percentTotalArray[1] < 75 && percentTotalArray[1] >= 50{
            greenPaint(tag: threeLeftWing)
        }else if percentTotalArray[1] < 50 && percentTotalArray[1] >= 25{
            orangePaint(tag: threeLeftWing)
        }else if percentTotalArray[1] < 25{
            redPaint(tag: threeLeftWing)
        }
        
        if percentTotalArray[2] >= 75{
            bluePaint(tag: threeCenter)
        }else if percentTotalArray[2] < 75 && percentTotalArray[2] >= 50{
            greenPaint(tag: threeCenter)
        }else if percentTotalArray[2] < 50 && percentTotalArray[2] >= 25{
            orangePaint(tag: threeCenter)
        }else if percentTotalArray[2] < 25{
            redPaint(tag: threeCenter)
        }
        
        if percentTotalArray[3] >= 75{
            bluePaint(tag: threeRightWing)
        }else if percentTotalArray[3] < 75 && percentTotalArray[3] >= 50{
            greenPaint(tag: threeRightWing)
        }else if percentTotalArray[3] < 50 && percentTotalArray[3] >= 25{
            orangePaint(tag: threeRightWing)
        }else if percentTotalArray[3] < 25{
            redPaint(tag: threeRightWing)
        }
        
        if percentTotalArray[4] >= 75{
            bluePaint(tag: threeRightCorner)
        }else if percentTotalArray[4] < 75 && percentTotalArray[4] >= 50{
            greenPaint(tag: threeRightCorner)
        }else if percentTotalArray[4] < 50 && percentTotalArray[4] >= 25{
            orangePaint(tag: threeRightCorner)
        }else if percentTotalArray[4] < 25{
            redPaint(tag: threeRightCorner)
        }
        
        if percentTotalArray[5] >= 75{
            bluePaint(tag: left)
        }else if percentTotalArray[5] < 75 && percentTotalArray[5] >= 50{
            greenPaint(tag: left)
        }else if percentTotalArray[5] < 50 && percentTotalArray[5] >= 25{
            orangePaint(tag: left)
        }else if percentTotalArray[5] < 25{
            redPaint(tag: left)
        }
        
        if percentTotalArray[6] >= 75{
            bluePaint(tag: middle)
        }else if percentTotalArray[6] < 75 && percentTotalArray[6] >= 50{
            greenPaint(tag: middle)
        }else if percentTotalArray[6] < 50 && percentTotalArray[6] >= 25{
            orangePaint(tag: middle)
        }else if percentTotalArray[6] < 25{
            redPaint(tag: middle)
        }
        
        if percentTotalArray[7] >= 75{
            bluePaint(tag: paintArea)
        }else if percentTotalArray[7] < 75 && percentTotalArray[7] >= 50{
            greenPaint(tag: paintArea)
        }else if percentTotalArray[7] < 50 && percentTotalArray[7] >= 25{
            orangePaint(tag: paintArea)
        }else if percentTotalArray[7] < 25{
            redPaint(tag: paintArea)
        }
        
        if percentTotalArray[8] >= 75{
            bluePaint(tag: right)
        }else if percentTotalArray[8] < 75 && percentTotalArray[8] >= 50{
            greenPaint(tag: right)
        }else if percentTotalArray[8] < 50 && percentTotalArray[8] >= 25{
            orangePaint(tag: right)
        }else if percentTotalArray[8] < 25{
            redPaint(tag: right)
        }
    }
    
    func bluePaint(tag: UILabel){
        tag.textColor = UIColor.blue
    }
    
    func greenPaint(tag: UILabel){
        tag.textColor = UIColor.brown
    }
    
    func orangePaint(tag: UILabel){
        tag.textColor = UIColor.magenta
    }
    
    func redPaint(tag: UILabel){
        tag.textColor = UIColor.red
    }
    

}
