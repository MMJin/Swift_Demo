//
//  HomeCollectionCell.swift
//  Swift_Demo
//
//  Created by FCNC05 on 2019/11/18.
//  Copyright © 2019 FCNC05. All rights reserved.
//

import Foundation
import UIKit
class Home_Cell: UICollectionViewCell {

    let width:CGFloat = 200.0//获取屏幕宽
    var imgView : UIImageView?//cell上的图片
    var titleLabel:UILabel?//cell上title
    var priceLabel:UILabel?//cell上价格
    var readLabel:UILabel?//cell上的阅读量

override init(frame: CGRect) {



    super.init(frame: frame)
    //初始化各种控件
    imgView = UIImageView()
    imgView?.frame = CGRect(x: 0, y: -10, width: (width-30)/2, height: 150)
    imgView?.image = UIImage.init(imageLiteralResourceName: "Launch")
    self .addSubview(imgView!)

    titleLabel = UILabel()
    titleLabel?.frame = CGRect(x: 5, y:imgView!.frame.maxY-12, width: imgView!.frame.maxY-12, height: 50)
    titleLabel?.numberOfLines = 0
    //titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .Weight)
    titleLabel?.textColor = UIColor.lightGray
    self .addSubview(titleLabel!)

    priceLabel = UILabel()
    priceLabel?.frame = CGRect(x: 5, y: titleLabel!.frame.maxY, width: (width-40)/2/2, height: 20)
    priceLabel?.numberOfLines = 0
    //priceLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: Weight)
    priceLabel?.textColor = UIColor.lightGray
    self .addSubview(priceLabel!)

    readLabel = UILabel()
    readLabel?.frame = CGRect(x: (width-30)/2/2, y: titleLabel!.frame.maxY, width: (width-40)/2/2, height: 20)
    readLabel?.numberOfLines = 0
    readLabel?.textAlignment = NSTextAlignment.right
   //readLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .Weight)
    readLabel?.textColor = UIColor.lightGray
    self .addSubview(readLabel!)

}

required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}

}
