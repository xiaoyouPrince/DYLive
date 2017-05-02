//
//  GameBaceModel.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/5/2.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

class GameBaceModel: NSObject {
    
    /// 组显示的标题
    var tag_name : String = ""
    /// 游戏对应的图标
    var icon_url : String = ""
    
    // 自定义初始化方法
    override init() {
        
    }
    
    init(dict : [String : Any]){
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) { }

}
