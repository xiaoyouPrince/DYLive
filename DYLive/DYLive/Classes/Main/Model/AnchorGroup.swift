//
//  AnchorGroup.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/4/16.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//
//  这个是swift中的model。

import UIKit

class AnchorGroup: NSObject {
    
    // MARK: - 对应的各个属性
    
    /// 该组中的对应的房间信息
    var room_list : [[String : NSObject]]? {
        
        didSet{
            
            // 判断
            guard let room_list = room_list else { return }
            
            // 遍历
            for dict in room_list {
                print(dict)
            }
        }
    }
    
    /// 组标题
    var  tag_name : String = ""
    /// 组显示的图标
    var icon_name : String = "home_header_normal"
    /// 游戏对应的图标
    var icon_url : String = ""
    
    
    // MARK: - 构造函数
    override init() {
        
    }
    
    // 自定义初始化方法
    init(dict : [String : NSObject]) {
        
        super.init()
        
        setValuesForKeys(dict)
    }
    
    // 挥空方法，防止报错
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
    
    
    

}
