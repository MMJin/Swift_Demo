//
//  CustomCenterBut.swift
//  Swift_Demo
//
//  Created by FCNC05 on 2019/10/28.
//  Copyright © 2019 FCNC05. All rights reserved.
//

import UIKit
//https://www.jianshu.com/p/a6c4ea3654e5
class CustomCenterBut: UIButton {
   override init(frame: CGRect) {
       super.init(frame:frame)
       self.setImage(UIImage.init(named: ""), for: UIControl.State.normal)
       self.setTitle("分享", for: UIControl.State.normal)
   }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
