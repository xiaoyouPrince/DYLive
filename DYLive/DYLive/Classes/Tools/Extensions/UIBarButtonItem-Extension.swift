//
//  UIBarButtonItem-Extension.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/4/1.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

// 创建swift源文件，生成UIBarButtonItem的类扩展
extension UIBarButtonItem{
    
    // 创建类方法，生成Item，传参数和返回值
    class func creatItem(imageName:String, highImageName:String, size:CGSize) -> UIBarButtonItem{
        
        // 1.生成自定义btn
        let btn = UIButton()
        
        // 2.设置btn的nomal图片和highlight图片
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: highImageName), for: .highlighted)
        
        // 3.设置btn的位置
        btn.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        
        // 4.返回根据btn生成的自定义barbuttonitem
        return UIBarButtonItem(customView: btn)
    }
    
}
