//
//  ViewController.swift
//  SOMySwift
//
//  Created by zwdeng on 16/4/15.
//  Copyright © 2016年 zwdeng. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tableview :UITableView?
    var tabledata :[String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        createCoreData()
//        createUIView()

    }
    
    func createCoreData(){
        let coredata :SOCoreData = SOCoreData()
        coredata.createData()
        coredata.fetchData()
    }
    
    func createUIView(){
        createUIView();
        createData();
        //        createHeader();
        self.view.backgroundColor = UIColor.whiteColor()
        if tableview == nil{
            self.tableview = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height),style: UITableViewStyle.Plain)
            self.view.addSubview(self.tableview!)
        }
        self.tableview?.delegate = self;
        self.tableview?.dataSource = self
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createHeader(){
        self.navigationController?.navigationBar.hidden = false
        self.navigationController?.navigationBar.backgroundColor = UIColor.redColor()
        self.navigationController?.navigationBar.barTintColor = UIColor.grayColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.blueColor(),NSFontAttributeName:UIFont(name: "Heiti SC", size: 17)!]
        self.title = "hahahaahah"
//        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "function")
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.translucent = true
        
        
        
        
        
        
        
    }
    func createData(){
        tabledata = ["deng","zhi","wu","hha","yyyes"]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tabledata?.count)!
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellID = "CelID"
        var cell = tableview?.dequeueReusableCellWithIdentifier(cellID) as? SOMyCell
        if cell  == nil {
            cell = SOMyCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
        }
        cell?.setContentView(tabledata![indexPath.row])
        return cell!;
    }


}

