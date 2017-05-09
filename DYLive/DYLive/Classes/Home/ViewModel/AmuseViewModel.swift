//
//  AmuseViewModel.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/5/3.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

class AmuseViewModel: BaseViewModel {


}


extension AmuseViewModel {
    
    func loadAmuseData(finishCallback: @escaping () -> ()) {
        loadAnchorData(isGroupData: true, URLString: "http://capi.douyucdn.cn/api/v1/getHotRoom/2") {
            finishCallback()
        }
    }
    
}
