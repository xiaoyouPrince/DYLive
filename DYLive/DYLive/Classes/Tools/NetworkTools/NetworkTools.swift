//
//  NetworkTools.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/4/10.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit
import Alamofire

enum RequestMethod  {
    
    case GET
    case POST
}

// 封装一个网络请求工具，这里不继承NSObject了，更加简洁一些
class NetworkTools {
    
    // 自定义一个类方法
    class func requestData(type:RequestMethod , URLString : String , parameters : [String : NSString]? = nil , finishCallBack:@escaping (_ response : AnyObject) -> ()){
        
        // 获取类型
        let method = type == .GET ? HTTPMethod.get : HTTPMethod.post
        
        Alamofire.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            
            // 1.校验返回值
            guard let result = response.result.value else{

                print(response.error!)
                return
            }
            
            // 2.回调正确的返回
            finishCallBack(result as AnyObject)
            
        }
    }
    
    
    // get请求
    class func getData(URLString : String , finishCallBack:@escaping (_ response : AnyObject) -> ()) {
        
        // 调用类方法
        requestData(type: .GET, URLString: URLString) { (response) in
            
            finishCallBack(response)
        }
        
    }
    
    
    /// post请求
    // MARK: - post请求
    class func postData(URLString : String , parameters : [String : NSString]? = nil, finishCallBack:@escaping (_ response : AnyObject) -> ()) {
        
        requestData(type:.POST, URLString: URLString, parameters: parameters) { (response) in
            finishCallBack(response)
        }
    }

}
