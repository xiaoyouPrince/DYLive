//
//  PageTitleView.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/4/1.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

/*
 1. 封装PageTitileView --> view：scrollview：Label+手势 & lineView
 2. 封装PageContentView --> uicollectionView->横向滚动的cell
 3. 处理PageTitleView和PageContentView的逻辑
 */


// MARK: - 定义自己代理
protocol PageTitleViewDelegate : class {
    
    // 这里只是方法的定义 --selectIndex index :分别是内部和外部属性
    func pageTitleView(titleView : PageTitleView , selectIndex index : Int)
    
}


// MARK: - 定义常量
private let kScrollLineH : CGFloat = 2
private let kNormalColor : (CGFloat, CGFloat, CGFloat) = (85, 85, 85)
private let kSelectColor : (CGFloat, CGFloat, CGFloat) = (255, 128, 0)


// MARK: - 类的声明
class PageTitleView: UIView {

    // MARK: - 自定义属性
    fileprivate var titles : [String]
    fileprivate var titleLabels : [UILabel] = [UILabel]()
    fileprivate var currentIndex : Int = 0 // 设置默认的当前下标为0
    weak var delegate : PageTitleViewDelegate?
    
    
    // MARK: - 懒加载属性
    fileprivate lazy var scrollView : UIScrollView = {[weak self] in
    
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.scrollsToTop = false
        
        return scrollView
    }();
    fileprivate lazy var scrollLine : UIView = {[weak self] in
        
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        
        return scrollLine
    }();
    
    
    // MARK: - 自定制PageTitleView的构造方法
    init(frame: CGRect, titles:[String]) {
        
        // 1.给自己的titles赋值
        self.titles = titles
        
        // 2.通过frame构造实例变量
        super.init(frame:frame)
        
        // 3.创建UI 
        setupUI()
        
    }
    
    // 自定义构造方法必须重写initwithCoder方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


// MARK: - 设置UI
extension PageTitleView{
    
    
    fileprivate func setupUI(){
        
        // 1.添加对应的scrollview
        addSubview(scrollView)
        scrollView.frame = self.bounds
        scrollView.backgroundColor = UIColor.yellow
        
        // 2.添加lable
        setupTitleLabels()
        
        // 3.添加底边线和可滑动的线
        setupBottomLineAndScrollLines()
        
    }
    
    
    // MARK: - 添加label
    private func setupTitleLabels(){
        
        // 0.对于有些只需要设置一遍的东西，放到外面来
        let labelW : CGFloat = frame.width / CGFloat(titles.count)
        let labelH : CGFloat = frame.height - kScrollLineH
        let labelY : CGFloat = 0.0
        
        for (index,title) in titles.enumerated(){
            
            // 1.创建Label
            let label = UILabel()
            
            // 2.设置对应的属性
            label.text = title
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.tag = index
            label.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
            label.textAlignment = .center
            
            // 3. 设置frame
            let labelX : CGFloat = CGFloat(index) * labelW
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            // 4.添加
            scrollView.addSubview(label)
            
            // 5.添加到Label的数组中
            titleLabels.append(label)
            
            // 6.给Label添加手势
            label.isUserInteractionEnabled = true
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(self.titleLabelClick(tapGes:)))
            label.addGestureRecognizer(tapGes)
            
        }
        
    }
    // MARK: - 设置底线 和 可以滚动的线
    private func setupBottomLineAndScrollLines(){
        
        let bottomLine = UIView()
        let bottomLineH : CGFloat = 0.5
        bottomLine.backgroundColor = UIColor.gray
        bottomLine.frame = CGRect(x: 0, y: frame.height - bottomLineH , width: frame.width, height: bottomLineH)
        addSubview(bottomLine)
        
        guard let label = titleLabels.first else {return}
        label.textColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
        scrollLine.frame = CGRect(x: label.bounds.origin.x, y: label.frame.origin.y+label.frame.height, width: label.frame.width, height: kScrollLineH)
        addSubview(scrollLine)
        
        

    }
}


// MARK: - 监听Label的点击 -- 必须使用@objc
extension PageTitleView{
    
    @objc fileprivate func titleLabelClick(tapGes : UITapGestureRecognizer){
        
        // 1.取到当前的label
        guard let currentLabel = tapGes.view as? UILabel else {
            return
        }
        
        // 2.获取之前的label
        let oldLabel = titleLabels[currentIndex]
        
        
        // 3.设置文字颜色改变
        currentLabel.textColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
        oldLabel.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)

        // 4.保存新的当前下边值
        currentIndex = currentLabel.tag
        
        // 5.滚动条的滚动
        let scrollLinePosition : CGFloat =  currentLabel.frame.origin.x
        UIView.animate(withDuration: 0.15) { 
            self.scrollLine.frame.origin.x = scrollLinePosition
        }
        
        // 6.通知代理做事情
        delegate?.pageTitleView(titleView: self, selectIndex: currentIndex)
        
    }
    
}


// MARK: - 暴露给外界的方法
extension PageTitleView{
    
    func setTitleWithProgress( progress : CGFloat, sourceIndex : Int, targetIndex : Int) {
        
        // 1.取出sourceLabel/targetLabel
        let sourceLabel = titleLabels[sourceIndex]
        let targetLabel = titleLabels[targetIndex]
        
        // 2.处理滑块的逻辑
        let moveTotalX = targetLabel.frame.origin.x - sourceLabel.frame.origin.x
        let moveX = moveTotalX * progress
        scrollLine.frame.origin.x = sourceLabel.frame.origin.x + moveX
        
        // 3.颜色的渐变(复杂)
        // 3.1.取出变化的范围
        let colorDelta = (kSelectColor.0 - kNormalColor.0, kSelectColor.1 - kNormalColor.1, kSelectColor.2 - kNormalColor.2)
        
        // 3.2.变化sourceLabel
        sourceLabel.textColor = UIColor(r: kSelectColor.0 - colorDelta.0 * progress, g: kSelectColor.1 - colorDelta.1 * progress, b: kSelectColor.2 - colorDelta.2 * progress)
        
        // 3.2.变化targetLabel
        targetLabel.textColor = UIColor(r: kNormalColor.0 + colorDelta.0 * progress, g: kNormalColor.1 + colorDelta.1 * progress, b: kNormalColor.2 + colorDelta.2 * progress)
        
        // 4.记录最新的index
        currentIndex = targetIndex
        
    }
        
    
}
