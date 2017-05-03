//
//  AmuseViewController.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/5/3.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

// MARK: - 定义常量
private let kItemMargin : CGFloat = 10
private let kItemWidth : CGFloat = (kScreenW - 3 * kItemMargin) / 2
private let kNormalItemHeight : CGFloat = kItemWidth * 3 / 4
private let kPrettyItemHeight : CGFloat = kItemWidth * 4 / 3

private let kCycleViewHeight : CGFloat = kScreenW * 3 / 8
private let kGameViewHeight : CGFloat = 90


private let kNormalCellID = "kNormalCellID"
private let kPrettyCellID = "kPrettyCellID"
private let kHeaderViewID = "kHeaderViewID"

class AmuseViewController: UIViewController {
    
    // MARK: - 懒加载collectionView
    fileprivate lazy var collectionView : UICollectionView = { [unowned self] in
        
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
    }

}

extension AmuseViewController{
    
    func buildUI() {
        
        view.addSubview(collectionView)
        
    }
}

extension AmuseViewController : UICollectionViewDataSource , UICollectionViewDelegateFlowLayout
{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 定义cell
        var cell : CollectionBaseCell!
        cell = collectionView .dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! CollectionNormalCell
        cell.backgroundColor = UIColor.randomColor()
        return cell

        
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        
//        // 1.创建header
//        let header : CollectionHeaderView = collectionView .dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! CollectionHeaderView
//        
//        // 2.给header赋值
//        header.group = recommendVM.anchorGroups[indexPath.section]
//        
//        return header
//        
//    }
    
    // 返回不同组cell的高度
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        if indexPath.section == 1 {
            return CGSize(width: kItemWidth, height: kPrettyItemHeight)
        }else
        {
            return CGSize(width: kItemWidth, height: kNormalItemHeight)
            
        }
    }
}
