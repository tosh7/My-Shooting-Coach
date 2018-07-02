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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        hiduke = datePicker.date
    }
    
    @IBAction func hyouzi(_ sender: Any) {
        dateLabel.text = String(from: Date(hiduke))
    }
}
