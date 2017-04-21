//
//  RecommendCycleView.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/4/21.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

let cycleCellID : String = "cycleCellID"


class RecommendCycleView: UIView {

    // MARK: - 设置内部空间
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    // MARK: - 系统回调
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        // MARK: - 设置cycle的 AutoResizingMask 为None，防止根据父控件改变
        autoresizingMask = .init(rawValue: 0)

    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        // 设置UI
        setupUI()
    }
    
}


extension RecommendCycleView{
    
    fileprivate func setupUI(){
        
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = collectionView.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal

        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
        // MARK: - 注册cell
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cycleCellID)
    }
    
}
    

// MARK: - 类方法快速创建
extension RecommendCycleView{
    class func recommendCycleView() -> RecommendCycleView{
        
        let cycleView = Bundle.main.loadNibNamed("RecommendCycleView", owner: self, options: nil)?.first
        
        return cycleView as! RecommendCycleView
    }
}

// MARK: - 内容的数据源方法
extension RecommendCycleView : UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cycleCellID, for: indexPath)
        if indexPath.row % 2 == 0 {cell.backgroundColor = UIColor.red }else{cell.backgroundColor = UIColor.yellow}
        return cell
        
    }
    
}
