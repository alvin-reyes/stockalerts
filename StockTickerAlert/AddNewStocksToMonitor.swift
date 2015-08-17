 //
//  AddNewStocksToMonitor.swift
//  StockTickerAlert
//
//  Created by Alvin Reyes on 8/4/15.
//  Copyright (c) 2015 Alvin Reyes. All rights reserved.
//

import UIKit

class AddNewStocksToMonitor: UIViewController,UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate,UISearchDisplayDelegate {
    
    @IBOutlet var searchBar:UISearchBar?;
    @IBOutlet var tableViewResult:UITableView?;
    
    var stocks = [StockItem]()
    var filteredStocks = [StockItem]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //  Create dummy data
        var stockItem1:StockItem = StockItem(name:"East West Banking Corporation",price:"20.21",code:"EW")
        var stockItem2:StockItem = StockItem(name:"Bank of the Philippine Islands",price:"98.50",code:"BPI")
        self.stocks.append(stockItem1);
        self.stocks.append(stockItem2);
        tableViewResult?.reloadData();
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        self.filteredStocks = self.stocks.filter({(stock:StockItem) -> Bool in
                var boolResult = stock.code?.rangeOfString(searchText);
                println(boolResult);
                return (boolResult != nil);
        });
        tableViewResult?.reloadData();
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if tableView == searchDisplayController?.searchResultsTableView {
            return self.filteredStocks.count
        }else {
            return self.stocks.count;
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.tableViewResult!.dequeueReusableCellWithIdentifier("cell") as! SearchStockTableViewCell
        if tableView == searchDisplayController?.searchResultsTableView {
            cell.codeLabel.text = self.filteredStocks[indexPath.row].code
            cell.companyName?.text = self.filteredStocks[indexPath.row].name
            cell.addStockButton.tag = indexPath.row
            cell.addPriceAlert.tag = indexPath.row
            cell.rowTagged = indexPath.row
        }else {
            cell.codeLabel.text = self.stocks[indexPath.row].code
            cell.companyName?.text =  self.stocks[indexPath.row].name
            cell.addStockButton.tag = indexPath.row
            cell.addPriceAlert.tag = indexPath.row
            cell.rowTagged = indexPath.row
        }
        return cell;
    }
    
    @IBAction func addToFront(sender:UIButton) {
        println("clcikng on it!\(sender.tag)");
        
        if tableViewResult == searchDisplayController?.searchResultsTableView {
            var stockItemForAlert:StockItem = StockItem();
            stockItemForAlert.code = self.filteredStocks[sender.tag].code;
            stockAlerts.append(stockItemForAlert)
        }else {
            var stockItemForAlert:StockItem = StockItem();
            stockItemForAlert.code = self.stocks[sender.tag].code;
            stockAlerts.append(stockItemForAlert)
        }
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let senderObj = sender as! UIButton
        var str:String! = senderObj.titleLabel!.text;
    
        switch str  {
            case "Details":
                var toSegueStockDetAdd = segue.destinationViewController as! StockDetailsViewerAdd
                if tableViewResult == searchDisplayController?.searchResultsTableView {
                    println(self.filteredStocks[senderObj.tag].code);
                    toSegueStockDetAdd.securityStr = self.filteredStocks[senderObj.tag].code
                }else {
                    println(self.stocks[senderObj.tag].code);
                    toSegueStockDetAdd.securityStr = self.stocks[senderObj.tag].code
                }
            case "Add Alert":
                var toSegueToModal = segue.destinationViewController as! AddAlertModal
                if tableViewResult == searchDisplayController?.searchResultsTableView {
                    toSegueToModal.securityCode = self.filteredStocks[senderObj.tag].code!
                }else {
                    println("sec code\(self.stocks[senderObj.tag].code)");
                    toSegueToModal.securityCode = self.stocks[senderObj.tag].code!
                }
        default:
            println("default");
        }
    }
    
}
