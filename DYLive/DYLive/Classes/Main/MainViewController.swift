//
//  MainViewController.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/3/30.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        addChildVc(storyboardName: "Home")
        addChildVc(storyboardName: "Living")
        addChildVc(storyboardName: "Fous")
        addChildVc(storyboardName: "Discovery")
        addChildVc(storyboardName: "Mine")

    }
    
    private func addChildVc(storyboardName:String)
    {
        // 通过storyBoard创建vc
        let childVc = UIStoryboard(name: storyboardName, bundle: nil).instantiateInitialViewController()!// 这边是可选类型，设置为确定类型
        
        // 把vc作为子控制器添加到根控制器上
        addChildViewController(childVc)
    }


}
