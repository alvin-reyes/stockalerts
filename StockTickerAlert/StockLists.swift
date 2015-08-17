//
//  StockLists.swift
//  StockTickerAlert
//
//  Created by Alvin Reyes on 8/4/15.
//  Copyright (c) 2015 Alvin Reyes. All rights reserved.
//

import Foundation

var stockAlerts:[StockItem] = [StockItem]();
var stockItemAlerts:[StockItemAlert] = [StockItemAlert]();

struct StockItem{
    var name:String?;
    var price:String?;
    var code:String?;
}

struct StockItemAlert {
    var code:String?;
    var alertAtPrice:Double?;
}
