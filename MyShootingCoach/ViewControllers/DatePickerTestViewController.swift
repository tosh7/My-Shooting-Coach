//
//  DatePickerTestViewController.swift
//  MyShootingCoach
//
//  Created by Satoshi Komatsu on 2018/07/02.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import UIKit

class DatePickerTestViewController: UIViewController {
    
    @IBOutlet var datePicker: UIDatePicker!
    var hiduke: Date!
    @IBOutlet weak var dateLabel: UILabel!
    //    var dataFormat = NSDateFormat()
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
       dateFormatter.locale = Locale(identifier: "ja_JP")
    dateFormatter.setLocalizedDateFormatFromTemplate("MMMMd")
    }
    
    @IBAction func hyouzi(_ sender: Any) {
        hiduke = datePicker.date
        //        dateLabel.text = String(from: Date(hiduke))
        //        hiduke.dateFormat = DateFormatter.dateFormat(fromTemplate: "ydMMM", options: 0, locale: Locale(identifier: "ja_JP"))
        //        dateFormatter.locale = Locale(identifier: "ja_JP")
        
        dateLabel.text = dateFormatter.string(from: hiduke)
        print(dateFormatter.string(from: hiduke))
        //        print(hiduke);
    }
}
