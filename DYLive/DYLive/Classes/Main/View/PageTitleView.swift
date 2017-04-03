//
//  PageTitleView.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/4/1.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

class PageTitleView: UIView {
    
    
    // MARK:-首页的页面分析
    // 1. 封装PageTitileView --> view：scrollview：Label+手势 & lineView
    // 2. 封装PageContentView --> uicollectionView->横向滚动的cell
    // 3. 处理PageTitleView和PageContentView的逻辑
    
    
    // MARK:-自定义的titles数组
    var titles : [String]
    

    // MARK:-自定制PageTitleView的构造方法
    // 自定义的构造方法，传入frame和对应的titles
    init(frame: CGRect, titles:[String]) {
        
        // 1.给自己的titles赋值
        self.titles = titles
        
        // 2.通过frame构造实例变量
        super.init(frame:frame)
        
    }
    
    // 自定义构造方法必须重写initwithCoder方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


// MARK:-设置UI
//extension PageTitleView{
//    
//    
//    fileprivate func setupUI{
//        
//    }
//    
//}
