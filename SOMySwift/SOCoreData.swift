//
//  SOCoreData.swift
//  SOMySwift
//
//  Created by zwdeng on 16/4/18.
//  Copyright © 2016年 zwdeng. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class SOCoreData: NSObject {
    var doc :UIManagedDocument;
    override init() {
        
        let manager :NSFileManager = NSFileManager.defaultManager()
        let url :NSURL = manager.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask).first!
        let path :NSURL = url.URLByAppendingPathComponent("MyDocument")
        doc = UIManagedDocument.init(fileURL: path)
    }
    
    func createData(){
        let contex :NSManagedObjectContext = doc.managedObjectContext;
        let contactInfo :NSManagedObject = NSEntityDescription.insertNewObjectForEntityForName("ContactInfo", inManagedObjectContext: contex) as NSManagedObject!
        contactInfo.setValue("deng", forKey: "name")
        contactInfo.setValue("24", forKey: "age")
        contactInfo.setValue("birthday 100", forKey: "birthday")
        
        let contactDetail :NSManagedObject = NSEntityDescription.insertNewObjectForEntityForName("ContactDetail", inManagedObjectContext: contex)
        contactDetail.setValue("addressB", forKey: "address")
        contactDetail.setValue("nameB", forKey: "name")
        contactDetail.setValue("1349984824", forKey: "tel")
        
        contactInfo.setValue(contactDetail, forKey: "detail")
        contactDetail.setValue(contactInfo, forKey: "info")
        do {
            try contex.save()
        }
        catch let error as NSError
        {
            print("不能保存：%@", error.description);
        }
        
    }
    func fetchData(){
        let context :NSManagedObjectContext = doc.managedObjectContext;
        let fetchRequest :NSFetchRequest  = NSFetchRequest()
        let entity :NSEntityDescription  = NSEntityDescription()
        entity.name = "ContactInfo"
        fetchRequest.entity = entity;
        var fetchObjects :[AnyObject]?
        do{
            try fetchObjects = context.executeFetchRequest(fetchRequest)
        } catch let error as NSError{
            print(error.description)
        }
        for item in fetchObjects!{
            print("name:%@", item.valueForKey("name"))
            print("age:%@", item.valueForKey("age"))
            print("birthday:%@", item.valueForKey("birthday"))
            let details :NSManagedObject = item.valueForKey("detail") as! NSManagedObject
            print("address:%@", details.valueForKey("address"))
            print("name:%@", details.valueForKey("name"))
            print("tel:%@", details.valueForKey("tel"))
            
        }
    }
}


