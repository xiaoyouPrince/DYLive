//
//  PageTitleView.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/4/1.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit


private let kScrollLineH : CGFloat = 2

protocol PageTitleViewDelegate : class {
    
    // 这里只是方法的定义 --selectIndex index :分别是内部和外部属性
    func pageTitleView(titleView : PageTitleView , selectIndex index : Int)
    
}


class PageTitleView: UIView {
    
    
    // MARK:-首页的页面分析
    // 1. 封装PageTitileView --> view：scrollview：Label+手势 & lineView
    // 2. 封装PageContentView --> uicollectionView->横向滚动的cell
    // 3. 处理PageTitleView和PageContentView的逻辑
    
    // MARK:-自定义属性
    // MARK:-自定义的titles数组
    fileprivate var titles : [String]
    fileprivate var titleLabels : [UILabel] = [UILabel]()
    fileprivate var currentIndex : Int = 0 // 设置默认的当前下标为0
    weak var delegate : PageTitleViewDelegate?
    
    
    // MARK:-懒加载属性
    // MARK:-添加子控件scrollview 
    // scrollView 如果别的地方也用到的话，就慵懒加载比较好
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
    
    
    // MARK:-自定制PageTitleView的构造方法
    // 自定义的构造方法，传入frame和对应的titles
    init(frame: CGRect, titles:[String]) {
        
        // 1.给自己的titles赋值
        self.titles = titles
        
        // 2.通过frame构造实例变量
        super.init(frame:frame)
        
        // 3.创建UI 
        // MARK:-为什么要在这里面写，我也没有搞清楚---反正是外面写的不对
        setupUI()
        
    }
    
    // 自定义构造方法必须重写initwithCoder方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


// MARK:-设置UI
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
    
    
    // MARK:-添加label
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
            label.textColor = UIColor.black
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
    // MARK:- 设置底线 和 可以滚动的线
    private func setupBottomLineAndScrollLines(){
        
        let bottomLine = UIView()
        let bottomLineH : CGFloat = 0.5
        bottomLine.backgroundColor = UIColor.gray
        bottomLine.frame = CGRect(x: 0, y: frame.height - bottomLineH , width: frame.width, height: bottomLineH)
        addSubview(bottomLine)
        
        guard let label = titleLabels.first else {return}
        label.textColor = UIColor.orange
        scrollLine.frame = CGRect(x: label.bounds.origin.x, y: label.frame.origin.y+label.frame.height, width: label.frame.width, height: kScrollLineH)
        addSubview(scrollLine)
        
        

    }
}

// MARK:-监听Label的点击 -- 必须使用@objc
extension PageTitleView{
    
    @objc fileprivate func titleLabelClick(tapGes : UITapGestureRecognizer){
        
        // 1.取到当前的label
        guard let currentLabel = tapGes.view as? UILabel else {
            return
        }
        
        // 2.获取之前的label
        let oldLabel = titleLabels[currentIndex]
        
        
        // 3.设置文字颜色改变
        currentLabel.textColor = UIColor.orange
        oldLabel.textColor = UIColor.black

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
