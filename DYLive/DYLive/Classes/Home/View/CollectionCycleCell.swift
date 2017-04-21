//
//  CollectionCycleCell.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/4/21.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

class CollectionCycleCell: UICollectionViewCell {
    
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    /// 创建自己Model属性
    var cycleModel : CycleModel? {
        didSet{
            
            // 展示数据
            titleLabel.text = cycleModel?.title
    
            let iconUrl = URL(string: cycleModel?.pic_url ?? "")
            iconImageView.kf.setImage(with: iconUrl, placeholder: UIImage(named:"Img_default"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
