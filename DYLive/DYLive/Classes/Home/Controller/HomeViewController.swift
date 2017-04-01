//
//  HomeViewController.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/3/31.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    }
    
    
    private func setupNavBar(){
        
        // 根据斗鱼首页NavBar来设置
        let size = CGSize(width: 40, height: 80)
        
        // logo
        let logoItem = UIButton()
        logoItem.setImage( UIImage(named:"logo"), for:.normal)
        logoItem.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoItem)
        
        // 右边items
        let historyItem = UIBarButtonItem.creatItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        
        let searchItem = UIBarButtonItem.creatItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        
        let qrcodeItem = UIBarButtonItem.creatItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        

        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
    }
}
