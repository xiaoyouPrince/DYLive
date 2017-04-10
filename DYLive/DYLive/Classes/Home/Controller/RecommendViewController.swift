//
//  RecommendViewController.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/4/7.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//
//  推荐页面

import UIKit


// MARK: - 定义常量
private let kItemMargin : CGFloat = 10
private let kItemWidth : CGFloat = (kScreenW - 3 * kItemMargin) / 2
private let kItemHeight : CGFloat = kItemWidth * 3 / 4

private let kNormalCellID = "kNormalCellID"
private let kHeaderViewID = "kHeaderViewID"


class RecommendViewController: UIViewController {
    
    // MARK: - 懒加载collectionView
    fileprivate lazy var collectionView : UICollectionView = { [unowned self] in
        
        var layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.minimumInteritemSpacing = kItemMargin
        layout.itemSize = CGSize(width: kItemWidth, height: kItemHeight)
        layout.headerReferenceSize = CGSize(width: kScreenW, height: 50)
        
        let collectionViewY : CGFloat = kStatusBarH + kNavBarH + kTabbarH
        let frame = CGRect(x: 0, y:0 , width: kScreenW, height: kScreenH - collectionViewY - kTabbarH)
        let collectionView = UICollectionView(frame: frame, collectionViewLayout:layout )
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        
        // 注册normal类型的cell
        collectionView.register(UINib(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: kNormalCellID)
        // 注册组头
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderViewID)

    
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // 创建UI
        creatUI()
        
        
        

        
        
        
    }


}

// MARK: - 创建UI页面
extension RecommendViewController{
    
    fileprivate func creatUI(){
        
        view.addSubview(collectionView)
    }
    
}


// MARK: - 遵守collectionView的数据源
extension RecommendViewController : UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 8
        }else
        {
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : UICollectionViewCell = collectionView .dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath)
        
         
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header : UICollectionReusableView = collectionView .dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath)
        
        return header
        
    }
}

// MARK: - 遵守collectionView的协议
extension RecommendViewController : UICollectionViewDelegate{
    
}
