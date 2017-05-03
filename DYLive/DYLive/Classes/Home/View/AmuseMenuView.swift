//
//  AmuseMenuView.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/5/4.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

class AmuseMenuView: UIView {
    
    // MARK: - 控件属性
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    

}

extension AmuseMenuView{
    class func creatMenuView() -> AmuseMenuView{
        return (Bundle.main.loadNibNamed("AmuseMenuView", owner: nil, options: nil)?.first as? AmuseMenuView)!
    }
}
