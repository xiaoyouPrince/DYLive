//
//  CollectionHeaderView.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/4/8.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {
    
    
    // MARK: - 控件的属性
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moreBtn: UIButton!
    
    // MARK: - 自定义模型，并监听
    var group : AnchorGroup? {
        
        didSet{
            nameLabel.text = group?.tag_name
            iconImageView.image = UIImage(named: group?.icon_name ?? "home_header_normal")
        }
    }
    
}


extension CollectionHeaderView
{
    class func creatHeaderView() -> CollectionHeaderView {
        
        let headerView = Bundle.main.loadNibNamed("CollectionHeaderView", owner: nil, options: nil)?.first as! CollectionHeaderView
        
        return headerView
        
    }
}

