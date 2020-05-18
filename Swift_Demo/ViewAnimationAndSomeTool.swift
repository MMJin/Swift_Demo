//
//  ViewAnimationAndSomeTool.swift
//  Swift_Demo
//
//  Created by FCNC05 on 2020/5/15.
//  Copyright © 2020 FCNC05. All rights reserved.
//

import UIKit

class ViewAnimationAndSomeTool: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    //声明全局变量
    var myColletionView : UICollectionView?


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12;
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //cell
        let itemId = "item"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemId, for: indexPath) as! Home_Cell
        cell.titleLabel?.text = "哈哈哈哈"
        return cell;
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("点击的cell", +indexPath.row);
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self .createUIForCollectionView()
        
    }
    

    func createUIForCollectionView() -> () {

            let myColletLayout = UICollectionViewFlowLayout()
            //方向
            myColletLayout.scrollDirection =  UICollectionView.ScrollDirection.horizontal
            self.myColletionView = UICollectionView(frame: CGRect(x: 0, y: 64, width: 200, height: 500), collectionViewLayout: myColletLayout)
            self.myColletionView!.backgroundColor = UIColor.white
            //注册cell
            self.myColletionView? .register(Home_Cell.self, forCellWithReuseIdentifier: "item")
            self.myColletionView?.delegate = self;
            self.myColletionView?.dataSource = self;
            myColletLayout.itemSize = CGSize(width: 80, height: 100)

            self.view .addSubview(self.myColletionView!)
        
    }

}
