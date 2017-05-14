//
//  CustomNavigationController.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/5/14.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//
//  自定义导航控制器 -- 截取对应的过程做事情

import UIKit

class CustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    // MARK: - 拦截push方法，设置被push的控制器直接隐藏底部tabbar
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            // 1.设置push之后tabbar隐藏
        viewController.hidesBottomBarWhenPushed = true
        super.pushViewController(viewController, animated: animated)
        
    }
}
