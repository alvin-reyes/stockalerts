//
//  AddAlertModal.swift
//  StockTickerAlert
//
//  Created by Alvin Reyes on 8/8/15.
//  Copyright (c) 2015 Alvin Reyes. All rights reserved.
//

import UIKit

class AddAlertModal : UIViewController, UIAlertViewDelegate {
    
    //  We need to get the securityCode to this modal dialog.
    @IBOutlet var priceAlert:UITextField!;
    @IBOutlet var securityLabel:UILabel!;
    var securityCode:String = String();
    
    @IBAction func cancel(sender: UIButton?) {
        self.dismissViewControllerAnimated(true, completion:nil);
    }
    
    @IBAction func done(sender: UIButton?) {
        var alert = UIAlertController(title: "Price Alert", message: "Stock price alert added", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
        stockItemAlerts.append(StockItemAlert(code:self.securityCode,alertAtPrice:
            (NSString(string:priceAlert.text).doubleValue)));
    
    }
    
    override func viewDidLoad() {
        println("viewDidload");
        super.viewDidLoad()
        self.securityLabel.text = self.securityCode
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        alertView.show();
    }
    
    
}
