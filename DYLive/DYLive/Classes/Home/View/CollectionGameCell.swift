//
//  CollectionGameCell.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/4/21.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionGameCell: UICollectionViewCell {
    
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    
    // MARK: - 设置数据
    var gameModel : AnchorGroup? {
        didSet{
            
            guard gameModel != nil else { return }
            
            // 组昵称
            nameLable.text = gameModel?.tag_name
            // 组图标
            // 这块需要可选绑定一下，防止崩溃
            let iconUrl = URL(string: gameModel?.icon_url ?? "")
            iconImageView.kf.setImage(with: iconUrl, placeholder: UIImage(named:"home_more_btn"), options: nil, progressBlock: nil, completionHandler: nil)
            
            
        }
    }
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
