//
//  CycleModel.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/4/21.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

class CycleModel: NSObject {
    
    /// 标题
    var title : String = ""
    /// 展示图片的地址
    var  pic_url : String = ""
    /// 主播信息字典
    var room : [String : NSObject]? {
        didSet{
            
            guard let room = room else { return }
            
            // 将对应的主播字典转成主播模型对象
            anchor = AnchorModel(dict: room)
        }
    }
    
    /// 主播信息对应的模型对象
    var anchor : AnchorModel?
    
    // MARK: - 自定义构造函数
    init(dict : [String : NSObject]) {
        super.init()
        
        // KVC
        setValuesForKeys(dict)
    }
    
    // 防止赋值崩溃
    override func setValue(_ value: Any?, forUndefinedKey key: String) { }
    
    
    
    

}
