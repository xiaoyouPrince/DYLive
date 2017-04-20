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
private let kNormalItemHeight : CGFloat = kItemWidth * 3 / 4
private let kPrettyItemHeight : CGFloat = kItemWidth * 4 / 3

private let kNormalCellID = "kNormalCellID"
private let kPrettyCellID = "kPrettyCellID"
private let kHeaderViewID = "kHeaderViewID"


class RecommendViewController: UIViewController {
    
    // MARK: - 懒加载RecommendViewModel
    fileprivate lazy var recommendVM : RecommendViewModel = RecommendViewModel()
    
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

        // 创建UI
        creatUI()
        
        
        loadData()

        
        
        
    }


}

// MARK: - 创建UI页面
extension RecommendViewController{
    
    fileprivate func creatUI(){
        
        view.addSubview(collectionView)
    }
    
}


// MARK: - 加载数据
extension RecommendViewController{
    
    fileprivate func loadData(){
        
        // 加载一下数据通过ViewModel
        
        recommendVM.requestData{
            
            // 1.请求完数据，进行刷新
            self.collectionView.reloadData()
            
        }
        
    }   
}


// MARK: - 遵守collectionView的数据源 
// UICollectionViewDelegateFlowLayout --继承自 UICollectionViewDelegate 用这个更加方便
extension RecommendViewController : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.recommendVM.anchorGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        let group = self.recommendVM.anchorGroups[section]
        
        return group.anchors.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 定义cell
//        var cell : UICollectionViewCell!
        // 取到model
        let group = recommendVM.anchorGroups[indexPath.section]
        let anchor = group.anchors[indexPath.row]
        
        
        // 判断位置
        if indexPath.section == 1 {
            
            var cell : CollectionPrettyCell!
            
            cell = collectionView .dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath) as! CollectionPrettyCell
            cell.anchor = anchor
            return cell

            
        }else
        {
            var cell : CollectionNormalCell!
            cell = collectionView .dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath) as! CollectionNormalCell
            
            return cell

        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        // 1.创建header
        let header : CollectionHeaderView = collectionView .dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath) as! CollectionHeaderView
        
        // 2.给header赋值
        header.group = recommendVM.anchorGroups[indexPath.section]
        
        return header
        
    }
    
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


