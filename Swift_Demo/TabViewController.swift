//
//  TabViewController.swift
//  Swift_Demo
//
//  Created by FCNC05 on 2019/10/28.
//  Copyright © 2019 FCNC05. All rights reserved.
//

import UIKit

private var arr = [
    [
        "text":"首页",
        "objc_vc":HomePage(),
        "img":"kk",
        "seling":"ww"

    ],[
        "objc_vc":HomePageTow(),
        "img":"dd",
        "seling":"gg",
        "text":"次页"
    ]

]

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewControllers = arr.map({

            let vc:UIViewController = $0["objc_vc"] as! UIViewController
            vc.tabBarItem = UITabBarItem(title: $0["text"] as? String, image: nil, selectedImage: nil)
            //vc.tabBarItem = UITabBarItem()
            return vc
        })
//        let vc1 = HomePage()
//        let vc2 = HomePageTow()
//        self.setViewControllers([vc1,vc2], animated: true)

        //self.tabBarItem = UITabBarItem(title: "主页", image: nil, selectedImage: nil)

    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
