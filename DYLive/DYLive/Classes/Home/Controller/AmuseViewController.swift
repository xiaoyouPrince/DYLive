//
//  AmuseViewController.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/5/3.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

private let kMenuViewH : CGFloat = 200

class AmuseViewController: BaceAnchorViewController {
    
    // MARK: - 懒加载
    fileprivate lazy var amuseVM : AmuseViewModel = AmuseViewModel()
    fileprivate lazy var menuView : AmuseMenuView = {
    
        let menuView = AmuseMenuView.creatMenuView()
        
        menuView.frame = CGRect(x: 0, y: -kMenuViewH, width: kScreenW, height: kMenuViewH)
        
        return menuView
        
    }()
}

extension AmuseViewController{
    override func buildUI() {
        super.buildUI()
        
        collectionView.addSubview(menuView)
        collectionView.contentInset = UIEdgeInsets(top: kMenuViewH, left: 0, bottom: 0, right: 0)
        
    }
}

extension AmuseViewController{
    override func loadData() {
        // 1.给父类的数据赋值
        super.baceVM = amuseVM
        
        // 2.请求数据
        self.amuseVM.loadAmuseData {
            
            // 2.1 刷新表格
            self.collectionView.reloadData()
            
            // 2.2 刷新上边的menuView
            var tempGroups = self.amuseVM.anchorGroups
            tempGroups.removeFirst()
            self.menuView.groups = tempGroups
            
            
            // 调用父类的加载完成方法
            self.loadDataFinished()
        }
    }
}



