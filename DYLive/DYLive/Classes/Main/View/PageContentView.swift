//
//  PageContentView.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/4/4.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

private let cellID : String = "CellID"

class PageContentView: UIView {
    
    // MARK:-定义属性
    fileprivate var childVcs : [UIViewController]
    fileprivate weak var parentVc : UIViewController? //防止强引用导致循环引用
    
    // MARK:-闭包加载collectionView -- 闭包内要对self进行弱化引用，防止循环引用
    fileprivate lazy var collectionView : UICollectionView = {[weak self] in
        
        // 1.创建layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = (self?.bounds.size)!
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        
        let collectionView = UICollectionView(frame: (self?.bounds)!, collectionViewLayout: layout)
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        // 设置数据源代理-并注册
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)

        
        return collectionView
    }()
    
    // MARK:-自定义构造行数
    init(frame: CGRect, childVcs : [UIViewController] , parentVc : UIViewController) {
     
        self.childVcs = childVcs
        self.parentVc = parentVc
        
        // 自定义构造函数必须显式调用 父类的对应方法
        super.init(frame:frame)
        
        // MARK:-创建UI
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}


// MARK:-设置UI
extension PageContentView{
    
    
    fileprivate func setupUI()
    {
        for childVc in childVcs {
            
            // 1.添加子控制器
            self.parentVc?.addChildViewController(childVc)
            
            // 2.设置内部的collectionview
            addSubview(collectionView)
        
        }
    }
    
}

// MARK:-遵守collectionVIew的DataSource代理
extension PageContentView : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.childVcs.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        // 1.复用cell
        let cell : UICollectionViewCell = collectionView .dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        
        // 2.设置cell内部view
        for view in cell.contentView.subviews{
            view.removeFromSuperview()
        }
        let childVc = childVcs[indexPath.item]
        cell.contentView.addSubview(childVc.view)
        
        return cell
    }
}
