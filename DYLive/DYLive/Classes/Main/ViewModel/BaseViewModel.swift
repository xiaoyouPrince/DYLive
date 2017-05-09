//
//  BaseViewModel.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/5/3.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//
//  首页 和 娱乐页面的VM的代码抽取

import UIKit

class BaseViewModel {
    
    /// 主播组
    lazy var anchorGroups : [AnchorGroup] = [AnchorGroup]()

}

extension BaseViewModel{
    
    func loadAnchorData(isGroupData: Bool , URLString : String , parameters : [String : Any]? = nil, finishCallback: @escaping () -> ()) {
        
        NetworkTools.requestData(type: .GET, URLString: URLString , parameters: parameters ) { (result) in
            
            
            // 转字典，校验
            guard let resultDict = result as? [String : Any] else {return}
            // 转成数组
            guard let dataArray = resultDict["data"] as? [[String : Any]] else {return}
            
            if isGroupData {
                
                // 字典转模型
                for dict in dataArray{
                    self.anchorGroups.append(AnchorGroup.init(dict : dict))
                }
            }else{
                
                // 趣玩页面数据结构不同,直接方法的anchorModel
                
                let group = AnchorGroup()
                
                for dict in dataArray {
                    group.anchors.append(AnchorModel(dict: dict))
                }
                
                self.anchorGroups.append(group)
            }
            
            // callBack
            finishCallback()
        }
    }
    
}
