//
//  HomeViewController.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/3/31.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

let titleViewH : CGFloat = 44




class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // MARK:-通过懒加载方式创建一个PageTitleView -- > 闭包的方式创建
        var pageTitleView : PageTitleView ;
        
        // 关闭系统自动给scrollview添加的那64内边距
        automaticallyAdjustsScrollViewInsets = false
        
        // MARK:- 创建UI
        setupUI()
        
    }

}


// Mark: - 创建首页UI页面
// 对首页controller的扩展，防止在主类里面写太多代码，
extension HomeViewController{
    
    
    // swift 3.0 之后的特性
    fileprivate func setupUI(){
        
        // 1. 设置导航栏
        setupNavBar()
        
        // 2. 添加PageTitleView
        view.addSubview(creatPageTitleView())
    }
    
    
    // MARK:-定义个有返回值的私有函数
    private func creatPageTitleView() -> PageTitleView{

            let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavBarH, width: kScreenW, height: titleViewH)
            let titles = ["推荐","游戏","娱乐","趣玩"];
            
            // 创建对应的titleView
            let titleView = PageTitleView.init(frame: titleFrame, titles: titles)
            
            titleView.backgroundColor = UIColor.red
            
            return titleView
    }
    
    
    private func setupNavBar(){
        
        // 根据斗鱼首页NavBar来设置
        let size = CGSize(width: 40, height: 80)
        
        // logo
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        // 右边items--通过构造方法来创建对应的item
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
    }
}
