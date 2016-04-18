//
//  SOMyCell.swift
//  SOMySwift
//
//  Created by zwdeng on 16/4/16.
//  Copyright © 2016年 zwdeng. All rights reserved.
//

import UIKit
class SOMyCell :UITableViewCell{
    var imageview :UIImageView!
    var title :UILabel!
    var subTitle :UILabel!

   override  init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createView();
    }
    func createView(){
        imageview  = UIImageView(frame:CGRect(x: 0, y: 0, width: 60, height: 60))
        imageview.image = UIImage(named: "AppIcon")
        self.contentView.userInteractionEnabled = true
        let tap :UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "tapHandle")
        self.contentView.addGestureRecognizer(tap)
        title = UILabel(frame: CGRect(x: 80, y: 0, width: 100, height: 32))
        subTitle = UILabel(frame:CGRect(x: 80, y: 32, width: 100, height: 32))
        self.contentView.addSubview(imageview)
        self.contentView.addSubview(title)
        self.contentView.addSubview(subTitle)
        
    }
    func setContentView(title :String){
        self.title.text = title;
        self.subTitle.text = title;
    }
    func tapHandle(){
        let alertView :UIAlertView  = UIAlertView()
        alertView.title = "你好"
        alertView.message = "你点击了我"
        alertView.addButtonWithTitle("OK")
        alertView.show()
        
    }
    

   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
}
