//
//  CollectionNormalCell.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/4/9.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

class CollectionNormalCell: UICollectionViewCell {
    
    // MARK: - 设置属性

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var onLineBtn: UIButton!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var roomNameLabel: UILabel!
    
    // MARK: - 设置model
    var anchor : AnchorModel?{
        didSet{
            // 1. 判断是否有值
            guard let anchor = anchor else { return }
            
            // 1.取出在线人数显示的文字
            var onlineStr : String = ""
            if anchor.online >= 10000 {
                onlineStr = "\(Int(anchor.online / 10000))万在线"
            } else {
                onlineStr = "\(anchor.online)在线"
            }
            onLineBtn.setTitle(onlineStr, for: UIControlState())
            
            // 2.昵称的显示
            nickNameLabel.text = anchor.nickname
            
            // 3.设置封面图片
            guard let iconURL = URL(string: anchor.vertical_src) else { return }
            iconImageView.kf.setImage(with: iconURL)

            // 4.设置房间名
            roomNameLabel.text = anchor.room_name

        }
    }
    
    
}
