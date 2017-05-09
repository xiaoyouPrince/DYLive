//
//  BaceAnchorViewController.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/5/3.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

// MARK: - 定义常量
private let kItemMargin : CGFloat = 10


private let kCycleViewHeight : CGFloat = kScreenW * 3 / 8
private let kGameViewHeight : CGFloat = 90

private let kNormalCellID = "kNormalCellID"
private let kHeaderViewID = "kHeaderViewID"

let kItemWidth : CGFloat = (kScreenW - 3 * kItemMargin) / 2
let kNormalItemHeight : CGFloat = kItemWidth * 3 / 4
let kPrettyItemHeight : CGFloat = kItemWidth * 4 / 3
let kPrettyCellID = "kPrettyCellID"


class BaceAnchorViewController: BaceViewController {
    
    // MARK: - 懒加载
    var baceVM : BaseViewModel! //定义一个属性，用的时候能直接用
    lazy var collectionView : UICollectionView = { [unowned self] in
        
        var layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.minimumInteritemSpacing = kItemMargin
        layout.itemSize = CGSize(width: kItemWidth, height: kNormalItemHeight)
        layout.headerReferenceSize = CGSize(width: kScreenW, height: 50)
        
        let collectionViewY : CGFloat = kStatusBarH + kNavBarH + kTabbarH
        let frame = CGRect(x: 0, y:0 , width: kScreenW, height: kScreenH - collectionViewY - kTabbarH)
        let collectionView = UICollectionView(frame: frame, collectionViewLayout:layout )
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // 注册normal类型的cell
        collectionView.register(UINib(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: kNormalCellID)
        collectionView.register(UINib(nibName: "CollectionPrettyCell", bundle: nil), forCellWithReuseIdentifier: kPrettyCellID)
        // 注册组头
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        
        
        return collectionView
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildUI()

        loadData()
        
    }

}


extension BaceAnchorViewController{
    
    override func buildUI() {
        
        
        
        view.addSubview(collectionView)
        
        contentView = collectionView
        
        super.buildUI()
    }
}

extension BaceAnchorViewController{
    
    func loadData() {
        self.collectionView.reloadData()
    }
}



extension BaceAnchorViewController : UICollectionViewDataSource , UICollectionViewDelegate
{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.baceVM.anchorGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let anchorGroup = self.baceVM.anchorGroups[section]
        
        return (anchorGroup.anchors.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 定义cell
        var cell : CollectionBaseCell!
        cell = collectionView .dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! CollectionNormalCell
        
        let anchorGroup = self.baceVM.anchorGroups[indexPath.section]
        
        cell.anchor = anchorGroup.anchors[indexPath.item]
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        // 1.创建header
        let header : CollectionHeaderView = collectionView .dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! CollectionHeaderView
        
        // 2.给header赋值
        header.group = self.baceVM.anchorGroups[indexPath.section]
        
        return header
        
    }
    

}
