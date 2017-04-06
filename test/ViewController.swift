//
//  ViewController.swift
//  test
//
//  Created by DM on 2016/11/8.
//  Copyright © 2016年 DM. All rights reserved.
//


import UIKit

class ViewController: UIViewController,valueChangeDelegae {
    
   var label:UILabel!
    
    var delegateLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let btn:UIButton = UIButton.init(type: UIButtonType.custom);
        btn .setTitle("下一个", for: UIControlState.normal);
        btn.frame = CGRect.init(x: 10, y: 150, width: 200, height: 44);
        btn.backgroundColor = UIColor.red;
        btn.addTarget(self, action: #selector(self.openSecond), for: UIControlEvents.touchUpInside);
        self.view.addSubview(btn);
        
        
        label = UILabel.init(frame: CGRect.init(x: 10, y: 200, width: 200, height: 44));
        label.backgroundColor = UIColor.green;
        label.text = "变化之前的"
        label.textAlignment = NSTextAlignment.center
        self.view.addSubview(label);
        
        delegateLabel = UILabel.init(frame: CGRect.init(x: 10, y: 250, width: 200, height: 44));
        delegateLabel.backgroundColor = UIColor.green;
        delegateLabel.text = "delegate"
        delegateLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(delegateLabel);
    
        
        _ = self.navigationController?.popViewController(animated: true);
    }
    
    func openSecond()
    {
        let secondVc = secondViewController();
        
        secondVc.sendValueBlock { (tempString) in
            print("tempString \(tempString)");
        }
        secondVc.changeDelegate = self;
        self .present(secondVc, animated: true, completion: nil);
    }
    
    //delegate
    func valueChange(changeValue: String) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

