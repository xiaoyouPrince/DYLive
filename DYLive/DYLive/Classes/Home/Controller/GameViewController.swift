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



class GameViewController: UIViewController {
    
    // MARK: - gameVM
    fileprivate lazy var gameVM : GameViewModel = GameViewModel()
    // MARK: - 懒加载collectionView
    fileprivate lazy var collectionView : UICollectionView = {[unowned self] in
        
        // 1.创建layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsetsMake(0, kEdgeMargin, 0, kEdgeMargin)
        
        
        // 2.创建collectionView
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        
        collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        
        return collectionView
        
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        creatUI()

        loadData()
        

    }

}


// MARK: - 创建UI
extension GameViewController{
    
    fileprivate func creatUI(){
        
        view.addSubview(collectionView)
        collectionView.autoresizingMask = .init(rawValue: 0)
        collectionView.contentInset = UIEdgeInsetsMake(kGameViewH + kHeaderViewH, 0, 0, 0)
        
    }
    
}

// MARK: - loadData
extension GameViewController{
    
    fileprivate func loadData(){
        
        self.gameVM.loadGameData {
            // 加载完数据，进行刷新
            self.collectionView.reloadData()
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
}