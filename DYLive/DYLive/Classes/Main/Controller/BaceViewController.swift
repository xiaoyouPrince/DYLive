//
//  BaceViewController.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/5/9.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

class BaceViewController: UIViewController {
    
    // MARK: - 动画属性
    var contentView : UIView?
    fileprivate lazy var imageView : UIImageView = { [unowned self] in
        
        let imageView = UIImageView(image: UIImage(named: "img_loading_1"))
        imageView.center = self.view.center
        imageView.animationImages = [UIImage(named: "img_loading_1")!,UIImage(named: "img_loading_2")!]
        imageView.animationDuration = 0.5
        imageView.animationRepeatCount = LONG_MAX
        imageView.autoresizingMask = [.flexibleTopMargin , .flexibleBottomMargin]
        return imageView
        
        }()

    // MARK: - 系统回调
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildUI()
    }

}

extension BaceViewController{
    
    func buildUI() {
        
        self.contentView?.isHidden = true
        
        view.addSubview(imageView)
        
        imageView.startAnimating()

        view.backgroundColor = UIColor(r: 250, g: 250, b: 250)
        
    }
    
    func loadDataFinished()  {
        
        self.imageView.stopAnimating()
        
        self.imageView.isHidden = true
        
        self.contentView?.isHidden = false
        
    }
    
}
