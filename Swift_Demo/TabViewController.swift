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
        "selimg":"ww"

    ],[
        "objc_vc":HomePageTow(),
        "img":"dd",
        "selimg":"gg",
        "text":"次页"
    ]

]
//自定义的tabBar
var tabBarView = UIView()
//tabbar高度
let tabBarViewHeight: CGFloat = 60
//tabbar颜色
let tabBarBackColor:UIColor = UIColor.yellow
//用来装imageView的数组
var tabImgViews = [UIImageView]()
class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
//        self.tabBar.isHidden = true
//
////初始化控制器
////
//        customTabar()


        self.viewControllers = arr.map({

        let vc:UIViewController = $0["objc_vc"] as! UIViewController
        vc.tabBarItem = UITabBarItem(title: $0["text"] as? String, image: nil, selectedImage: nil)
        //vc.tabBarItem = UITabBarItem()
        return vc
        })


//        let vc1 = HomePage()
//        let vc2 = HomePageTow()
    //    self.setViewControllers([vc1,vc2], animated: true)

        //self.tabBarItem = UITabBarItem(title: "主页", image: nil, selectedImage: nil)
    }

    /// 自定义tabBar
    func customTabar() -> Void {
        let ScreenW = UIScreen.main.bounds.size.width
        let ScreenH = UIScreen.main.bounds.size.height

//设置高度
        tabBarView = UIView(frame: CGRect(x: 0, y: ScreenH - tabBarViewHeight, width: ScreenW, height: tabBarViewHeight))
        tabBarView.backgroundColor = tabBarBackColor
        self.view.addSubview(tabBarView)

        //根据数据源等分tabbar
        for index in 0..<arr.count {
            //let count = arr.count as? CGFloat
           let count = CGFloat(arr.count)
            print(count,index)
           let btn = UIButton(frame: CGRect(x:10+(CGFloat(index)*(((ScreenW-30)/count)+10)),y: (CGFloat)(5), width:(ScreenW-30)/count, height:45))
            tabBarView.addSubview(btn)

            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))

            let dic = arr[index] as NSDictionary
//dic["title"] as? String
            label.text = "a123"

            label.textAlignment = .center
            label.tag = 200 + index
            label.font = UIFont.systemFont(ofSize:11)

            label.textColor = UIColor.white
            label.backgroundColor = UIColor.black;
            btn.backgroundColor = UIColor.red
            label.center = btn.center;

            btn.addSubview(label)

            let tabImg = UIImageView(frame: CGRect(x: UIScreen.main.bounds.size.width/8 , y: 0, width: 30, height: 30))

            tabImg.image = UIImage(named: (dic["img"] as? String)!)

            tabImg.tag = 300 + index

            btn.addSubview(tabImg)

            if (index==0) {

            tabImg.image =  UIImage(named:(dic["selimg"] as? String)!)

            }

            btn.tag = index + 100

            //btn.addTarget(self, action:#selector(btn(tabAction:)), for:.touchUpInside)
            btn.addTarget(self, action: #selector(tabAction(obj:)), for: .touchUpInside)

            btn.bringSubviewToFront(btn)

            tabImgViews.append(tabImg)

            }

        }

    /*

     点击tabbarItem操作

     */

  @objc  func tabAction(obj: UIButton) -> Void

     {


     let indexSel = obj.tag - 100

     let dic = arr[indexSel] as NSDictionary

     //对应选中的控制器

    self.selectedIndex = indexSel

     for index in 0..<tabImgViews.count

     {

     if(index == indexSel)

     {

     tabImgViews[indexSel].image = UIImage(named: (dic["selimg"] as? String)!)

     }else{

     tabImgViews[index].image = UIImage(named: (dic["selimg"] as? String)!)

     }

     }
     }

    func initControllers() -> Void

    {

//        var firstTabView = UIView()
//        firstTabView = HomePageTow().view
//
//        var secondTabView = UIView()
//        secondTabView = HomePageTow().view

//    let thirdTabView = UIStoryboard.init(name:"ThirdPage" , bundle: nil).instantiateViewController(withIdentifier: "ThirdPageViewController")

    let viewArr = [HomePageTow(), HomePageTow()]

    var viewCtlArr = [AnyObject]()

    for index in 0..<viewArr.count

    {

    if(index != 1)

    {

    let navController = UINavigationController(rootViewController: viewArr[index])

    viewCtlArr.append(navController)

    }else{

    viewCtlArr.append(viewArr[index])

    }

    }

        self.viewControllers = (viewArr as [UIViewController])

    }

    }//类








