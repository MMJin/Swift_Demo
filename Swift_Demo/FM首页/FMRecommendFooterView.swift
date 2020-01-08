//
//  FMRecommendFooterView.swift
//  Swift_Demo
//
//  Created by FCNC05 on 2019/11/21.
//  Copyright © 2019 FCNC05. All rights reserved.
//


import UIKit

class FMRecommendFooterView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = FooterViewColor
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
