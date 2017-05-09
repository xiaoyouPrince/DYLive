//
//  FunnyViewModel.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/5/9.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

class FunnyViewModel: BaseViewModel {
    
    

}


extension FunnyViewModel
{
    func loadFunnyData(  finishCallBack:@escaping() -> ()) {
        
        loadAnchorData(isGroupData: false, URLString: "http://capi.douyucdn.cn/api/v1/getColumnRoom/3", parameters: ["limit":"30" , "offset":"0"]) {
            finishCallBack()
        }
        
    }
}
