//
//  NSDate.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/4/15.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import Foundation


extension NSDate{
    
    // MARK: - 返回当前时间，返回类型为String
    // 这里定义的是类方法，必须用class来注明，否则报：对象方法不能用类调用的错误
    class func getCurrentTime() -> String {
        
        let date = NSDate()
        let timeInterval = date.timeIntervalSince1970
        
        return "\(timeInterval)"
    }
    
}
