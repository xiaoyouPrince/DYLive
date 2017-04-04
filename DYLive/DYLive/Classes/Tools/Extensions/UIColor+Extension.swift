//
//  UIColor+Extension.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/4/4.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

// 重写一个UIColor的扩展，通过重写构造方法实现

extension UIColor{
    
    // MARK:-便利构造方法
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat){
        
        // MARK:-必须通过self调用显式的构造方法
        self.init(red: r / 255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
    
}

