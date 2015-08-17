//
//  ViewController.swift
//  StockTickerAlert
//
//  Created by Alvin Reyes on 8/4/15.
//  Copyright (c) 2015 Alvin Reyes. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var stockAlertDataCell:UITableViewCell!;
    
    var alertList:[StockItem] = [StockItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView?.reloadData();
    }
    
    

    //  Table view datasource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockItemAlerts.count;
    }
    
    //  For each cell.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell:StockAlertDataCell = self.tableView.dequeueReusableCellWithIdentifier("resultcell") as! StockAlertDataCell
//        var cell:StockAlertDataCell = StockAlertDataCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Test")
        
        cell.code!.text = stockItemAlerts[indexPath.row].code
        cell.price!.text = stockItemAlerts[indexPath.row].alertAtPrice?.description;
        return cell;
        
    }
    
    //  We need this to control the delete.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            stockItemAlerts.removeAtIndex(indexPath.row);
            tableView.reloadData();
        }
    }

}

