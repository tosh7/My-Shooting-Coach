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
    
    @IBOutlet var UILabelArray: [UILabel] = []
    var takeTotalArray: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var makeTotalArray: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var percentTotalArray: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let realm = try! Realm()
    var shootDataArray: Results<ShootData>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shootDataArray = realm.objects(ShootData.self)
        cluc()
        put()
    }
    
    func cluc(){
        if(shootDataArray.count != 0){
            
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
                    
                default:
                    break
                }
            }
        }
        
        for j in 0...8{
            if takeTotalArray[j] != 0{
                percentTotalArray[j] = makeTotalArray[j] *  100 / takeTotalArray[j]
            }
        }
    }
    
    func put(){
        var number: Int!
        
        for i in 0...8{
            UILabelArray[i].text = "\(percentTotalArray[i])%"
            if percentTotalArray[i] >= 75{
                number = 1
            }else if percentTotalArray[i] < 75 && percentTotalArray[i] >= 50{
                number = 2
            }else if percentTotalArray[0] < 50 && percentTotalArray[i] >= 25{
                number = 3
            }else if percentTotalArray[i] < 25{
                number = 4
            }
            paint(num: number, tag: UILabelArray[i])
        }
    }
    
    func paint(num: Int, tag:UILabel){
        switch num {
        case 1:
            tag.textColor = UIColor.blue
        case 2:
            tag.textColor = UIColor.brown
        case 3:
            tag.textColor = UIColor.magenta
        case 4:
            tag.textColor = UIColor.red
        default:
            break
        }
    }
}
