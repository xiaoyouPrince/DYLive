//
//  RoomNormalViewController.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/5/14.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

class RoomNormalViewController: UIViewController , UIGestureRecognizerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        // 设置自己隐藏navigationBar的时候依然保留系统的边缘返回手势！
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}
