//
//  AmuseViewModel.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/5/3.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

class AmuseViewModel: NSObject {
    
    lazy var anchorGroups : [AnchorGroup] = [AnchorGroup]()
    

}


extension AmuseViewModel {
    
    func loadAmuseData(finishCallback: @escaping () -> ()) {
        
        NetworkTools.requestData(type: .GET, URLString: "http://capi.douyucdn.cn/api/v1/getHotRoom/2") { (result) in
            
            // 转字典，校验
            guard let resultDict = result as? [String : Any] else {return}
            // 转成数组
            guard let dataArray = resultDict["data"] as? [[String : Any]] else {return}
            
            // 字典转模型
            for dict in dataArray{
                self.anchorGroups.append(AnchorGroup.init(dict : dict))
            }
            
            // callBack
            finishCallback()
            
        }
    }
    
}
