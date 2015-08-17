//
//  SearchStockTableViewCell.swift
//  StockTickerAlert
//
//  Created by Alvin Reyes on 8/7/15.
//  Copyright (c) 2015 Alvin Reyes. All rights reserved.
//

import UIKit

class SearchStockTableViewCell: UITableViewCell {
    
    @IBOutlet var codeLabel: UILabel!
    @IBOutlet var companyName: UILabel!
    @IBOutlet var currentPrice: UILabel!;
    
    @IBOutlet weak var addPriceAlert: UIButton!
    @IBOutlet weak var addStockButton: UIButton!
    
    var rowTagged:Int = Int();
    
    override func awakeFromNib() {
        super.awakeFromNib();
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated);
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        
    }
    
}
