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
    
    // 自己的属性
    var cycleTimer : Timer?
    
    
    // MARK: - 模型数据行
    var cycleModels : [CycleModel]?{
        didSet{
            
            // 1.刷新自己的collectionView
            self.collectionView.reloadData()
            
            // 2.设置pageControl的页码
            self.pageControl.numberOfPages = self.cycleModels?.count ?? 0
            
            // 3.一上来直接让滚动到很多的地方，模拟无限轮播
            let indexPath = IndexPath(item: (cycleModels?.count ?? 0) * 10, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .left, animated: false)
            
            // 4.创建定时器，让他自己滚动
            removeTimer()
            addCycleTimer()
            
        }
    }
    

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
        collectionView.register(UINib.init(nibName: "CollectionCycleCell", bundle: nil), forCellWithReuseIdentifier: cycleCellID)
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // 这里的 self.cycleModels? 是可选类型，返回的值也是可选类型，所以当返回值为空的时候通过  ?? 语法转化为 0
        return (self.cycleModels?.count ?? 0) * 10000 // 设置无限轮播的假象
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cycleCellID, for: indexPath) as! CollectionCycleCell
        
        let model = (self.cycleModels![(indexPath.item) % self.cycleModels!.count]) //防止数组越界
        cell.cycleModel = model
        
        if indexPath.row % 2 == 0 {cell.backgroundColor = UIColor.red }else{cell.backgroundColor = UIColor.yellow}
        return cell
        
    }
    
}

// MARK: - 内容的代理方法
extension RecommendCycleView : UICollectionViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetX = scrollView.contentOffset.x + scrollView.bounds.size.width * 0.5
        
        self.pageControl.currentPage = Int(offsetX / scrollView.bounds.size.width) % (cycleModels?.count ?? 1) //防止pageControl不滚动
    }
    
    // MARK: - 用户手动拖拽和停止拖拽
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        removeTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        addCycleTimer()
    }
    
}


// MARK: - 定时器的处理,自动滚动
extension RecommendCycleView{
    
    
    fileprivate func addCycleTimer() {
        
        cycleTimer = Timer(timeInterval: 3.0, target: self, selector: #selector(self.scrollToNextPage), userInfo: nil, repeats: true)
        RunLoop.main.add( cycleTimer!, forMode: .commonModes)
    }
    
    
    fileprivate func removeTimer(){
        
        cycleTimer?.invalidate()
        cycleTimer = nil
    }

    
    
    @objc fileprivate func scrollToNextPage(){
        
        // 滚动到下一页，当前的偏移量加一倍宽度
        let currentOffsetX = collectionView.contentOffset.x
        let offsetX = currentOffsetX + collectionView.bounds.size.width
        
        collectionView.setContentOffset(CGPoint(x:offsetX , y : 0), animated: true)   
    }
}
