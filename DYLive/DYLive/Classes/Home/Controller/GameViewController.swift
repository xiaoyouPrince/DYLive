//
//  GameViewController.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/4/28.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit


private let kEdgeMargin : CGFloat = 10
private let kItemW : CGFloat = ( kScreenW - 2 * kEdgeMargin) / 3
private let kItemH : CGFloat = kItemW * 6 / 5
private let kHeaderViewH : CGFloat = 50
private let kGameViewH : CGFloat = 90

private let kGameCellID = "GameCellID"
private let kHeaderViewID = "kHeaderViewID"


class GameViewController: BaceViewController {
    
    // MARK: - gameVM
    fileprivate lazy var gameVM : GameViewModel = GameViewModel()
    // MARK: - 懒加载collectionView
    fileprivate lazy var collectionView : UICollectionView = {[unowned self] in
        
        // 1.创建layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: kEdgeMargin, bottom: 0, right: kEdgeMargin)
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        
        
        // 2.创建collectionView
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle:nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        
        return collectionView
        
    }()
    fileprivate lazy var gameView : RecommendGameView = {
    
        let gameView = RecommendGameView.creatGameView()
        gameView.frame = CGRect(x: 0, y: -kGameViewH, width: kScreenW, height: kGameViewH)
        return gameView
        
    }()
    fileprivate lazy var topHeaderView : CollectionHeaderView = {
    
        let topHeaderView = CollectionHeaderView.creatHeaderView()
        topHeaderView.frame = CGRect(x: 0, y: -(kHeaderViewH + kGameViewH), width: kScreenW, height: kHeaderViewH)
        
        topHeaderView.iconImageView.image = UIImage(named: "Img_orange")
        topHeaderView.nameLabel.text = "常见"
        topHeaderView.moreBtn.isHidden = true
        
        return topHeaderView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        buildUI()

        loadData()
    }
    

}


// MARK: - 创建UI
extension GameViewController{
    
    override func buildUI(){
        
        
        super.contentView = collectionView
        
        
        view.addSubview(collectionView)
        collectionView.addSubview(topHeaderView)
        collectionView.addSubview(gameView)
        collectionView.contentInset = UIEdgeInsets(top: kGameViewH + kHeaderViewH, left: 0, bottom: kGameViewH + kHeaderViewH, right: 0)
        
        
        super.buildUI()
        
    }
    
}

// MARK: - loadData
extension GameViewController{
    
    fileprivate func loadData(){
        
        self.gameVM.loadGameData {
            // 加载完数据，进行刷新
            self.collectionView.reloadData()
            
            // gameView进行页面刷新
            // 外部处理数据
            let games = Array(self.gameVM.games[0..<10])
            self.gameView.groups = games
            
            // 调用父类的加载完成方法
            self.loadDataFinished()
        }
        
    }
    
}


extension GameViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.gameVM.games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! CollectionGameCell
        
        let gameModel = self.gameVM.games[indexPath.item]
        
        cell.gameModel = gameModel
        
        cell.backgroundColor = UIColor.white
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kHeaderViewID, for: indexPath) as! CollectionHeaderView
        
        header.iconImageView.image = UIImage(named: "Img_orange")
        header.nameLabel.text = "全部"
        header.moreBtn.isHidden = true
        
        return header
         
    }
}
