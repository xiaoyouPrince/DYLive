//
//  CollectionPrettyCell.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/4/10.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit
import Kingfisher


class CollectionPrettyCell: CollectionBaseCell {
    
    
    // MARK: - 设置属性
    @IBOutlet weak var cityBtn: UIButton!
    
    // MARK: - 定义model
    override var anchor : AnchorModel?{
        // 监听赋值model
        didSet{
            
            super.anchor = anchor
            
            // 4.设置城市
            cityBtn.setTitle(anchor?.anchor_city, for: .normal)
            
        }
    }
    
}
