//
//  HomePageTow.swift
//  Swift_Demo
//
//  Created by FCNC05 on 2019/10/28.
//  Copyright © 2019 FCNC05. All rights reserved.
//

import Foundation
import UIKit

class HomePageTow: UIViewController,UITableViewDataSource,UITableViewDelegate {
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
        self.setUI()
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
        navView.frame = CGRect(x: 0, y: 0, width:screenW , height: 84)
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

   @objc func backVC() -> () {
    self.navigationController?.popViewController(animated: true)
    }
}
