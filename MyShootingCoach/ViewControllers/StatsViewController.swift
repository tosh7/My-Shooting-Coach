//
//  StatsViewController.swift
//  MyShootingCoach
//
//  Created by Satoshi Komatsu on 2017/09/25.
//  Copyright © 2017年 Satoshi Komatsu. All rights reserved.
//

import UIKit
import RealmSwift

class StatsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    let realm = try! Realm()
    var shootDataArray: Results<ShootData>!
    var refreshControl: UIRefreshControl!
//    var numberArray: [Double]!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        table.dataSource = self
        
        shootDataArray = realm.objects(ShootData.self)
        print(shootDataArray[0])
        print(shootDataArray.count)
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "引っ張って更新")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        table.addSubview(refreshControl)
        
    }
    
    @objc func refresh(){
        print(refresh)
        koushin()
        table.dataSource = self
        shootDataArray = realm.objects(ShootData.self)
        refreshControl?.endRefreshing()
    }
    
    
    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return shootDataArray.count
    }
    
    //セルの中身を設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
//        numberArray[indexPath.row] = Double(Int(shootDataArray[indexPath.row].percent * 100) / 100)
        
        if shootDataArray[indexPath.row].area != "Z"{
            cell?.textLabel?.text = "\(shootDataArray[indexPath.row].month)/\(shootDataArray[indexPath.row].day)    \(shootDataArray[indexPath.row].make)/\(shootDataArray[indexPath.row].take)   \(shootDataArray[indexPath.row].percent)%   Area:\(shootDataArray[indexPath.row].area)"
        }
        
        return cell!
    }
    
    func koushin(){
        print(1)
        table.dataSource = self
        shootDataArray = realm.objects(ShootData.self)
    }
    
    
}
