//
//  secondViewController.swift
//  test
//
//  Created by DM on 2016/11/8.
//  Copyright © 2016年 DM. All rights reserved.
//

import UIKit

protocol valueChangeDelegae {
    func valueChange(changeValue:String)
}

//声明block
typealias sendValueToLast = (_ string:String)->Void

class secondViewController: UIViewController {
    
    //创建一个闭包属性
    var sendValueBlock : sendValueToLast?
    func sendValueBlock(block: @escaping (_ string:String)->Void) {
        sendValueBlock = block;
    }
    
    var changeDelegate : valueChangeDelegae?=nil

    var testTable:testTableView?
    
    let dataAry = NSMutableArray.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white;
        
        let btn:UIButton = UIButton.init(type: UIButtonType.custom);
        btn .setTitle("上一个", for: UIControlState.normal);
        btn.frame = CGRect.init(x: 10, y: 150, width: 200, height: 44);
        btn.backgroundColor = UIColor.red;
        btn.addTarget(self, action: #selector(self.backLast), for: UIControlEvents.touchUpInside);
        self.view.addSubview(btn);
        
        testTable = testTableView.init(frame: CGRect.init(x: 10, y: 200, width: 300, height: 400), style: UITableViewStyle.plain);
        self.view.addSubview(testTable!);
        
        for _ in 1...5 {
            dataAry.add("Tess")
        }
        
        testTable?.dataAry = dataAry;
        testTable?.selectRowBlock(block: { (indexPath) in
            print(indexPath)
            
            for _ in 1...5 {
                self.dataAry.add("Tess")
            }
            
            self.testTable?.reloadData()
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backLast()
    {

    
        
        if (self.sendValueBlock != nil)
        {
            self.sendValueBlock!("")
        }
        
        let stringTemp = "这个是从代理穿过来的值";
        self.changeDelegate?.valueChange(changeValue: stringTemp)
        
        self .dismiss(animated: true, completion: nil)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
