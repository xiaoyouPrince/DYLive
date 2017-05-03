//
//  HomeViewController.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/3/31.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

private let titleViewH : CGFloat = 44



// MARK: - 类的声明
class HomeViewController: UIViewController {
    
    
    // MARK: - 懒加载pagetitleView
    lazy var pageTitleView : PageTitleView = { [weak self] in
        
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavBarH, width: kScreenW, height: titleViewH)
        let titles = ["推荐","游戏","娱乐","趣玩"];
        
        // 创建对应的titleView
        let titleView = PageTitleView.init(frame: titleFrame, titles: titles)
//        titleView.backgroundColor = UIColor.red
        
        // 成为代理
        titleView.delegate = self  //因为在titleView中已经进行 ？ 处理了，所以这里不写 ？ 否则代理设置不成功
        
        return titleView
        
    }()
    // MARK:-懒加载一个pageContentView
    lazy var pageContentView : PageContentView = { [weak self] in
        
        // 1.确定frame
        let contentY : CGFloat = kStatusBarH + kNavBarH + titleViewH
        let contentH = kScreenH - contentY
        let contentFrame = CGRect(x: 0, y: contentY, width: kScreenW, height: contentH)
        
        // 2.创建对应的contentView
        var contentVcs = [UIViewController]()
        
        // 2.1 第一个是推荐
        contentVcs.append(RecommendViewController())
        contentVcs.append(GameViewController())
        contentVcs.append(AmuseViewController())
        
        for index in 0..<1 {
            
            let childVc = UIViewController()
            
            if  index % 2 == 0{
                childVc.view.backgroundColor = UIColor.green
            }else
            {
                childVc.view.backgroundColor = UIColor.yellow
            }
            
            contentVcs.append(childVc)
            
        }
        
        let contentView = PageContentView(frame: contentFrame, childVcs:contentVcs , parentVc: self!)
        contentView.backgroundColor = UIColor.red
        contentView.delegate = self
        
        return contentView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 关闭系统自动给scrollview添加的那64内边距
        automaticallyAdjustsScrollViewInsets = false
        
        // MARK:- 创建UI
        setupUI()
        
    }

}


// Mark: - 创建首页UI页面
extension HomeViewController{
    
    // swift 3.0 之后的特性
    fileprivate func setupUI(){
        
        // 1. 设置导航栏
        setupNavBar()
        
        // 2. 添加PageTitleView
        view.addSubview(pageTitleView)
        
        // 3.添加pageContentView
        view.addSubview(pageContentView)
    }
    
    fileprivate func setupNavBar(){
        
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


// MARK:-遵循PageTitleViewDelegate
extension HomeViewController : PageTitleViewDelegate {
    
    func pageTitleView(titleView: PageTitleView, selectIndex index: Int) {
        
        // 通知contentView修改对应的Index
        pageContentView.setCurrnetIndex(currentIndex: index)
    }
}


// MARK: - 遵守PageContentView的Delegate方法
extension HomeViewController : PageContentViewDelegate{
    
    func pageContentView(_ contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        // 接收到代理方法之后，通知titleView去处理对应的文字、滑块、颜色等变化

        pageTitleView.setTitleWithProgress(progress : progress, sourceIndex : sourceIndex, targetIndex : targetIndex)
    }
}


