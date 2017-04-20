//
//  CollectionNormalCell.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/4/9.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

class CollectionNormalCell: CollectionBaseCell {
    

    @IBOutlet weak var roomNameLabel: UILabel!
    
    // MARK: - 设置model
    override var anchor : AnchorModel?{
        didSet{

            super.anchor = anchor
            
            // 1.设置房间名
            roomNameLabel.text = anchor?.room_name

        }
    }
    
    
}
