//
//  GameViewModel.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/5/2.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

class GameViewModel: NSObject {
    
    // MARK: - 懒加载属性
    lazy var games : [GameModel] = [GameModel]()

}


extension GameViewModel
{
    func loadGameData(finishCallBack : @escaping () -> ()) {
        
        NetworkTools.requestData(type: .GET, URLString: "http://capi.douyucdn.cn/api/v1/getColumnDetail", parameters: ["shortName" : "game"]) { (result) in
            
            // 1.获取数据
            guard let resultDict = result as? [String : Any] else {return}
            guard let dataArray = resultDict["data"] as? [[String : Any]] else {return}
            
            // 2.字典转model
            for dict in dataArray {
                
                self.games.append(GameModel.init(dict: dict))
            }
            
            // 3.huidaio
            finishCallBack()
            
        }
        
    }
}
