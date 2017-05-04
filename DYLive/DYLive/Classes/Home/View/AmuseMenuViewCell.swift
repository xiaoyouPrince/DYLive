//
//  AmuseMenuViewCell.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/5/4.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

private let kGameCellID = "kGameCellID"

class AmuseMenuViewCell: UICollectionViewCell {
    
    // MARK: - 控件属性
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // MARK: - 模型属性
    var groups : [AnchorGroup]? {
        
        didSet{
            collectionView.reloadData()
        }
    }
    

    // MARK: - 系统回调
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register( UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .vertical
        
        let itemW = self.bounds.size.width / 4
        let itemH = self.bounds.size.height / 2
        layout.itemSize = CGSize(width: itemW, height: itemH)
        
    }

}

extension AmuseMenuViewCell : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups?.count ?? 0 // 第一次肯定没有
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! CollectionGameCell

        cell.gameModel = groups?[indexPath.item]
        cell.bottomLine.isHidden = true
        
        return cell
    }
}



