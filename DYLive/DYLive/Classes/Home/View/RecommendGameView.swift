//
//  RecommendGameView.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/4/21.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit


private let GameCellID : String = "GameCellID"
private let kEdgeInsetMargin : CGFloat = 10


class RecommendGameView: UIView {
    
    // MARK: - 内部控件
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - 属性
    var groups : [AnchorGroup]? {
        didSet{
            
            // 验证
            guard groups != nil else { return }
            
            // 去除前两组--添加最后一组更多
            groups?.remove(at: 0)
            groups?.remove(at: 0)
            
            let group = AnchorGroup()
            group.tag_name = "more"
            groups?.append(group)
            
            // 刷新自己数据
            self.collectionView.reloadData()
        }
    }
    
    
    // 创建UI
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 设置自己的AutoResizingMake = None
        autoresizingMask = .init(rawValue: 0)
        
        buildUI()
    }
    

}

// MARK: - 创建UI
extension RecommendGameView{
    
    func buildUI() {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 90)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: kEdgeInsetMargin, bottom: 0, right: kEdgeInsetMargin)
        collectionView.register(UINib.init(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: GameCellID)
    }
    
}


// MARK: - 快速创建的类方法
extension RecommendGameView{
    class func creatGameView() -> RecommendGameView{
        
        let gameView = Bundle.main.loadNibNamed("RecommendGameView", owner: self, options: nil)?.first

        return gameView as! RecommendGameView
    }
}


// MARK: - CollectionView DataSource
extension RecommendGameView : UICollectionViewDataSource
{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.groups?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCellID, for: indexPath) as!CollectionGameCell
        cell.gameModel = self.groups![indexPath.item]
//        cell.backgroundColor = indexPath.item % 2 == 0 ? UIColor.red : UIColor.green
        return cell;
        
    }
}


// MARK: - CollectionView delegate
extension RecommendGameView : UICollectionViewDelegate
{
    
}
