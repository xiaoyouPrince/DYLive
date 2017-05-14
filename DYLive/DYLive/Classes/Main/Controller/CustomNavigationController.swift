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
        
        // 1.拿到系统的返回手势
        let systemGes = self.interactivePopGestureRecognizer!
        
        // 2.获取手势当前的view
        guard let gesView = systemGes.view else {   return      }
        
        // 3.获取对应的target / action
        var count : UInt32 = 0
        let iVars = class_copyIvarList(UIGestureRecognizer.self, &count)!
        
        for i in 0..<count {
            let ivar = iVars[Int(i)]
            let name = ivar_getName(ivar)
            print(String(cString : name!))
        }
        
        guard let targets = systemGes.value(forKey: "_targets") as? [NSObject] else {  return }
        guard let targetObj = targets.first else {return }
        print(targetObj)
        
        // target
        let target = targetObj.value(forKey: "target")
        // action
//        let action = targetObj.value(forKey: "action") as? Selector
        let action = Selector(("handleNavigationTransition:")) //想方法获取到action
        
        
        let panGes = UIPanGestureRecognizer()
        gesView.addGestureRecognizer(panGes)
        panGes.addTarget(target!, action: action)
 
    }
    

    // MARK: - 拦截push方法，设置被push的控制器直接隐藏底部tabbar
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            // 1.设置push之后tabbar隐藏
        viewController.hidesBottomBarWhenPushed = true
        super.pushViewController(viewController, animated: animated)
        
    }
}
