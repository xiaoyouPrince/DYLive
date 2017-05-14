//
//  RoomShowViewController.swift
//  DYLive
//
//  Created by 渠晓友 on 2017/5/14.
//  Copyright © 2017年 xiaoyouPrince. All rights reserved.
//

import UIKit

class RoomShowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.purple
        
    }
}


extension RoomShowViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
}
