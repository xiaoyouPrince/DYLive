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
private let kCycleViewHeight : CGFloat = kScreenW * 3 / 8
private let kGameViewHeight : CGFloat = 90



class RecommendViewController: BaceAnchorViewController {
    
    // MARK: - 懒加载RecommendViewModel
    fileprivate lazy var recommendVM : RecommendViewModel = RecommendViewModel()

    // MARK: - 懒加载cycleView
    fileprivate lazy var cycleView : RecommendCycleView = {
        
        let cycleView = RecommendCycleView.recommendCycleView()
        cycleView.frame = CGRect(x: 0, y: -(kCycleViewHeight + kGameViewHeight), width: kScreenW, height: kCycleViewHeight)
        return cycleView
    }()
    // MARK: - 懒加载游戏gameView
    fileprivate lazy var gameView : RecommendGameView = {
        
        let gameView = RecommendGameView.creatGameView()
        gameView.frame = CGRect(x: 0, y: -kGameViewHeight, width: kScreenW, height: kGameViewHeight )
        return gameView
    }()

}

// MARK: - 创建UI页面
extension RecommendViewController{
    

    override func buildUI() {
        
        super.buildUI()
        
        collectionView.addSubview(cycleView)
        collectionView.addSubview(gameView)
        collectionView.contentInset = UIEdgeInsets(top: kCycleViewHeight + kGameViewHeight, left: 0, bottom: 0, right: 0)

    }
    
}


// MARK: - 加载数据
extension RecommendViewController{
    
    override func loadData(){
        
        super.baceVM = recommendVM
        
        // MARK: - 请求推荐数据
        recommendVM.requestData{
            
            // 1.请求完数据，进行刷新
            self.collectionView.reloadData()
            
            // 2.刷新gameView的数据
            // 2.1 验证（外部传递的时候自己处理好数据）
            // 去除前两组--添加最后一组更多
            self.recommendVM.anchorGroups.remove(at: 0)
            self.recommendVM.anchorGroups.remove(at: 0)
            
            let group = AnchorGroup()
            group.tag_name = "more"
            self.recommendVM.anchorGroups.append(group)
        
            self.gameView.groups = self.recommendVM.anchorGroups
            
            // 调用父类的加载完成方法
            self.loadDataFinished()
            
        }
        
        // MARK: - 请求轮播数据
        recommendVM.requestCycleData { 
            // 请求完成，刷新数据
            self.cycleView.cycleModels = self.recommendVM.cycleModels
        }
        
    }   
}

extension RecommendViewController : UICollectionViewDelegateFlowLayout{
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 重写当第一组的话是prettyCell
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath) as! CollectionPrettyCell
            
            cell.anchor = self.recommendVM.anchorGroups[indexPath.section].anchors[indexPath.item]
            
            return cell
        }
        
        return super.collectionView(collectionView, cellForItemAt: indexPath)
        
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





