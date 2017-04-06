//
//  testTableView.swift
//  test
//
//  Created by DM on 2016/11/8.
//  Copyright © 2016年 DM. All rights reserved.
//

import UIKit

typealias SelectRowBlock = (IndexPath) -> Void

class testTableView: UITableView,UITableViewDataSource,UITableViewDelegate {

    var dataAry:NSArray = []
    
    var selectRowBlock : SelectRowBlock?
    func selectRowBlock(block: @escaping (IndexPath) -> Void) {
        selectRowBlock = block
    }

    override
    init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataAry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cellid  = "cellid"
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellid)
        
        let string:NSString = dataAry[indexPath.row] as! NSString;
        cell.textLabel?.text = string as String;
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (self.selectRowBlock != nil)
        {
            self.selectRowBlock!(indexPath);
        }
        if(self.selectRowBlock != nil) {
            self.selectRowBlock!(indexPath)
        }
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
