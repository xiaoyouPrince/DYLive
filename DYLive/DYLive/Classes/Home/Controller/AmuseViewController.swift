//
//  AmuseViewController.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/5/3.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

class AmuseViewController: BaceAnchorViewController {
    
    // MARK: - 懒加载
    fileprivate lazy var amuseVM : AmuseViewModel = AmuseViewModel()
}

extension AmuseViewController{
    override func buildUI() {
        super.buildUI()
        
    }
}

extension AmuseViewController{
    override func loadData() {
        // 1.给父类的数据赋值
        super.baceVM = amuseVM
        
        self.amuseVM.loadAmuseData {
            self.collectionView.reloadData()
        }
    }
}



