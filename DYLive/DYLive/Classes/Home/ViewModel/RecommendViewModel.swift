//
//  RecommendViewModel.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/4/18.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

class RecommendViewModel { // 这里没有用到对应的NSObject特性就不继承了

    
    
}


// MARK: - 请求推荐页面数据
extension RecommendViewModel{
    
    func requestData() {
        
//        NetworkTools.requestData(type: .GET, URLString: <#T##String#>, parameters: <#T##[String : NSString]?#>, finishCallBack: <#T##(AnyObject) -> ()#>)
        
        NetworkTools.getData(URLString: "http://capi.douyucdn.cn/api/v1/getbigDataRoom") { (result) in
            
        }
        
        NetworkTools.requestData(type: .GET, URLString: "http://capi.douyucdn.cn/api/v1/getbigDataRoom", parameters: ["time": NSDate.getCurrentTime() as NSString]) { (result) in
            
            // 处理对应的result
            
            print(result)
        }

    }
    
}
