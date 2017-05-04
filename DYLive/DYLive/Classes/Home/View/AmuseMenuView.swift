//
//  AmuseMenuView.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/5/4.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

private let kMenuCellID = "kMenuCellID"

class AmuseMenuView: UIView {
    
    // MARK: - 控件属性
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var groups : [AnchorGroup]? {
        didSet{
            collectionView.reloadData()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        collectionView.dataSource = self
        
        
        collectionView.register(UINib(nibName: "AmuseMenuViewCell", bundle: nil), forCellWithReuseIdentifier: kMenuCellID)
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        // 设置一些布局
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true

    }
}

// MARK: - 快速返回对象的类方法
extension AmuseMenuView{
    class func creatMenuView() -> AmuseMenuView{
        return (Bundle.main.loadNibNamed("AmuseMenuView", owner: nil, options: nil)?.first as? AmuseMenuView)!
    }
}

// MARK: - 代理fangfa
extension AmuseMenuView : UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        if groups?.count == 0 || groups == nil {  return 0  }
        
        let pageNum = ((groups?.count)! - 1) / 8 + 1
        pageControl.numberOfPages = pageNum
        
        return pageNum
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kMenuCellID, for: indexPath) as! AmuseMenuViewCell
        
        // 子页面是 8个/页 所以单独处理一下数据再复制
        setupCellDataWithCell(cell: cell, indexPath: indexPath)
        
        return cell
    }
    
    func setupCellDataWithCell(cell : AmuseMenuViewCell , indexPath : IndexPath)  {
        
        //在原来的groups中 分页 按对应的 8个/页 划分对应的页
        // 1页 ： 0 - 7
        // 2页 ： 8 - 15
        // 3页 ： 16 - 23
        
        let startIndex = indexPath.item * 8
        var endIndex = (indexPath.item + 1) * 8 - 1
        
        // 越界处理
        if endIndex >= (self.groups?.count)! - 1 {
            endIndex = (self.groups?.count)! - 1
        }
        
        // 赋值
        cell.groups = Array(groups![startIndex...endIndex])
        
    }
}


// MARK: - 页面滚动，代理使用
extension AmuseMenuView : UICollectionViewDelegate
{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPage = Int(collectionView.contentOffset.x / self.bounds.size.width + 0.5)
        pageControl.currentPage = currentPage
    }
}


