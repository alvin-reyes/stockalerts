//
//  StockAlertDataCell.swift
//  StockTickerAlert
//
//  Created by Alvin Reyes on 8/9/15.
//  Copyright (c) 2015 Alvin Reyes. All rights reserved.
//

import UIKit

class StockAlertDataCell:UITableViewCell {
    
    @IBOutlet var code:UILabel!;
    @IBOutlet var price:UILabel!;
    
    override func awakeFromNib() {
        super.awakeFromNib();
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated);
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        
    }
    
    
}
