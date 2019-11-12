//
//  AlertTool.swift
//  Swift_Demo
//
//  Created by FCNC05 on 2019/11/4.
//  Copyright © 2019 FCNC05. All rights reserved.
//

import UIKit

//typealias AlertHandler = (() -> ())
//typealias AlertTwoHandler = (() -> (String))

class AlertUtil: NSObject {
//对闭包做声明 逃逸和非逃逸（区别在于实在函数执行完后一段时间执行还是之前被调用--网络请求一般都是逃逸的函数执行完后一段时间后返回结果）
    func aletcv(_ vc:UIViewController ,mybolock:@escaping(_ str:String) -> ()){
        let alertCtrl = UIAlertController.init(title: "温馨提示", message: "确认前往网页？", preferredStyle: UIAlertController.Style.alert)
        let al = UIAlertAction(title: "确认", style: UIAlertAction.Style.default) { (a) in
        mybolock("jinmingming")
        }
        let cancleAl = UIAlertAction(title: "取消", style: UIAlertAction.Style.default) { (a) in
          mybolock("点击了取消了")
        }
        alertCtrl.addAction(al)
        alertCtrl.addAction(cancleAl)
        vc.present(alertCtrl, animated: true, completion: nil)
    }

//    static func showPermissionWarining(vc: UIViewController, title: String?, message: String?, permitHandler: AlertHandler?, cancelHandler: AlertHandler?) {
//let alertCtrl = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
//let permitAction = UIAlertAction.init(title: "permit", style: UIAlertAction.Style.default) { (action) in
//    permitHandler?()
//}
//let cancelAction = UIAlertAction.init(title: "cancel", style: UIAlertAction.Style.cancel) { (action) in
//    cancelHandler?()
//        }
//        alertCtrl.addAction(permitAction)
//        alertCtrl.addAction(cancelAction)
////        alertCtrl.show(vc, sender: nil)
////        alertCtrl.present(vc, animated: true, completion: {
////            print("alertCtrl completion")
////        })
//        vc.present(alertCtrl, animated: true) {
//            print("alertCtrl completion")
//        }
//    }
//
//    static func showSomeAlert(vc:UIViewController, title:String?,message:String?,resultSuccess:AlertTwoHandler?){
//        let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
//        let permitAction = UIAlertAction.init(title: "确认", style: UIAlertAction.Style.default) { (action) in
//            let backStr = resultSuccess?()
//            print(backStr as Any)
//        }
//        alert.addAction(permitAction)
//
//
//
//
//    }
}
