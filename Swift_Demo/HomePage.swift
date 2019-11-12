//
//  HomePage.swift
//  Swift_Demo
//
//  Created by FCNC05 on 2019/10/28.
//  Copyright © 2019 FCNC05. All rights reserved.
//

import Foundation
import UIKit

class HomePage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        let btn = CustomCenterBut(frame: CGRect(x: 0, y: 84, width: 50, height: 50))
        btn.backgroundColor = UIColor.red
        btn .addTarget(self, action: #selector(shareAlertAction), for: .touchUpInside)
        self.view .addSubview(btn)
    }

    @objc func shareAlertAction(){
        let a = AlertUtil()
        a.aletcv(self) { (str) in
            self .jump(str: str)
            print(str)
        }
    }
    @objc func jump(str:String?) -> () {
        if str == "jinmingming" {
            //let vc = HomePage()
            self.view.backgroundColor = UIColor.green
            self.navigationController?.pushViewController(HomePageTow(), animated: true)
        }
    }

}
