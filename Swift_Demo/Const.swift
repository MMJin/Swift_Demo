//
//  Const.swift
//  Swift_Demo
//
//  Created by FCNC05 on 2019/11/20.
//  Copyright © 2019 FCNC05. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import SnapKit
import SwiftyJSON
import HandyJSON
import SwiftMessages

let YYScreenWidth = UIScreen.main.bounds.size.width
let YYScreenHeigth = UIScreen.main.bounds.size.height
let DominantColor = UIColor.init(red: 242/255.0, green: 77/255.0, blue: 51/255.0, alpha: 1)
let FooterViewColor = UIColor.init(red: 240/255.0, green: 241/255.0, blue: 244/255.0, alpha: 1)

// iphone X
//let isIphoneX = YYScreenHeigth == 812 ? true : false
let screenHeight = UIScreen.main.nativeBounds.size.height;
let typeIsIphoneX = screenHeight == 2436 || screenHeight == 1792 || screenHeight == 2688 || screenHeight == 1624 ? true : false
// navigationBarHeight
let navigationBarHeight : CGFloat = typeIsIphoneX ? 88 : 64
// tabBarHeight
let tabBarHeight : CGFloat = typeIsIphoneX ? 49 + 34 : 49




