//
//  HomePageTow.swift
//  Swift_Demo
//
//  Created by FCNC05 on 2019/10/28.
//  Copyright © 2019 FCNC05. All rights reserved.
//

import Foundation
import UIKit
//声明


class HomePageTow: UIViewController,UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource{
    var myCollectionView : UICollectionView?
    var data = NSMutableArray()
    //返回一个区多少个Item
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    //返回一个cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Home_Cell//as! 自定义cell
        cell.priceLabel!.text = "￥"+"100"
        cell.readLabel!.text = "?"+"11"

    return cell
    }
   func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
   //区头大小
        return CGSize(width: 100, height: 100)
    }
    //返回自定义HeadView或者FootView，我这里以headview为例
    private func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView{
        var v = UICollectionReusableView()
        if kind == UICollectionView.elementKindSectionHeader{
            v = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headView", for: indexPath as IndexPath)
        }
        return v
    }
    //返回cell 上下左右的间距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
        return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    }



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //注册cell
        let cellId = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        }

        cell?.textLabel?.text = "这是个标题"

        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        self.setCollectionViewUI()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true;
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false;
    }

    func setUI(){
        let navView = UIView()
        let screenW = UIScreen.main.bounds.size.width
        navView.frame = CGRect(x: 0, y: 0, width:YYScreenWidth , height: 84)
        navView.backgroundColor = UIColor.init(red: 30.0, green: 60.0, blue: 40.0, alpha: 0.5)
        self.view .addSubview(navView)

        let backBtn = UIButton()
        backBtn.setTitle("返回", for: UIControl.State.normal)
        backBtn.setTitle("点击", for: UIControl.State.highlighted)
        backBtn.frame = CGRect(x: 10, y: 42, width: 40, height: 30)
        backBtn .addTarget(self, action: #selector(backVC), for: .touchUpInside)
        backBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        navView .addSubview(backBtn)

        let titLab = UILabel()
        titLab.frame = CGRect(x: screenW/2-40, y: 42, width: 80, height: 30)
        titLab.text = "丫丫充电"
        titLab.textColor = UIColor.red
        navView .addSubview(titLab)

        let tableV = UITableView()
        tableV.delegate = self;
        tableV.dataSource = self;
        tableV.frame = CGRect(x: 0, y: 84, width: screenW, height: UIScreen.main.bounds.size.height-84)
        self.view .addSubview(tableV)

    }

    func setCollectionViewUI() -> () {
        //设置collectionView 的布局
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        let colltionView = UICollectionView(frame: CGRect(x: 0, y: 84, width: YYScreenWidth, height: UIScreen.main.bounds.size.height), collectionViewLayout: layout)
           //注册一个cell
        colltionView.register(Home_Cell.self, forCellWithReuseIdentifier:"cell")
           //注册一个headView
        colltionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headView")
        colltionView.delegate = self;
        colltionView.dataSource = self;
        colltionView.backgroundColor = UIColor.white
           //设置每一个cell的宽高
        layout.itemSize = CGSize(width: (200-30)/2,height: 200)
        self.view .addSubview(colltionView)
        
    }

   @objc func backVC() -> () {
    self.navigationController?.popViewController(animated: true)
    }
}


