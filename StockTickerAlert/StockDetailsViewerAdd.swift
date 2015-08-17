//
//  StockDetailsViewerAdd.swift
//  StockTickerAlert
//
//  Created by Alvin Reyes on 8/8/15.
//  Copyright (c) 2015 Alvin Reyes. All rights reserved.
//

import UIKit
import Foundation

class StockDetailsViewerAdd :UIViewController {
    
    @IBOutlet weak var secLabel: UILabel!
    var securityStr:String? = String();
    var jsonString:String = "[{name:alvin},{name:Jay}]"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.secLabel.text = self.securityStr;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
