//
//  AlertTool.swift
//  Swift_Demo
//
//  Created by FCNC05 on 2019/11/4.
//  Copyright © 2019 FCNC05. All rights reserved.
//

import UIKit
///可空的无参无返回值 Block
typealias AlertCompleteOptional = (() -> Swift.Void)?
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
class WSAlertController: NSObject{
    //MARK: 链式初始化方法
    private var title: String?
    private var actionArray: [(String,UIAlertAction.Style,AlertCompleteOptional)] = []

    init(title: String?) {
        self.title = title
    }
    //添加@objc 表示oc方法是可以调用的
    /// 类方法初始化链式
    @objc class func alertSheet(title: String?) -> WSAlertController{
        //自定义的init初始化方法
        return WSAlertController(title: title)
    }
    //当有返回值的方法未得到接收和使用时通常会出现图片中的提示： result call ......  加上之后就不会了
    @discardableResult
    @objc func add(title: String, style: UIAlertAction.Style, complete: AlertCompleteOptional) -> WSAlertController{
        actionArray.append((title,style,complete))
        return self
    }

    @objc func finish() ->UIAlertController{
        return WSAlertController.alertControllerSheet(title: self.title, actionArray: self.actionArray)
    }

    /// 使用actionSheet样式的系统AlertControllerSheet封装
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - hitSender: 当为ipad设备时给予一个附着的控件
    ///   - actionArray: 每个action独立元组数组
    /// - Returns: 返回这个alertController用于显示出来
    private class func alertControllerSheet(title: String?,
                                            actionArray: [(String,UIAlertAction.Style,AlertCompleteOptional)]) -> UIAlertController{

        let alertVC = UIAlertController(title: title, message: nil, preferredStyle:.actionSheet)
        //元组（类似结构体） 取值
        for action in actionArray{
            let alertAction = UIAlertAction(title: action.0, style: action.1, handler: { (_) in
                action.2?()
            })
            alertVC.addAction(alertAction)
        }
        addPopPresenterView(alertVC: alertVC)
        return alertVC
    }


    //MARK: 类方法
    /// 返回alertController 有取消和确定按钮
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - message: 内容
    ///   - okTitle: 确定按钮的文字
    ///   - okComplete: 回调事件
    /// - Returns: alertController 实例
    @objc class func alertAlert(title: String?, message: String?, okTitle: String, cancelTitle: String? = nil, okComplete: AlertCompleteOptional) -> UIAlertController{

        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: okTitle, style: .default, handler: { (_) in
            if okComplete != nil{
                okComplete!()
            }
        })

        let cancel = UIAlertAction(title: cancelTitle ?? "取消", style: .cancel) { (alert: UIAlertAction) -> Void in
        }

        alertVC.addAction(alertAction)
        alertVC.addAction(cancel)
        addPopPresenterView(alertVC: alertVC)
        return alertVC
    }

    /// 返回alertController 仅确定按钮
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - message: 内容
    ///   - okTitle: 确定按钮的文字
    ///   - okComplete: 回调事件
    /// - Returns: alertController 实例
    @objc class func alertAlert(title: String?, message: String?, okTitle: String, okComplete: AlertCompleteOptional) -> UIAlertController{

        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: okTitle, style: .default, handler: { (_) in
            if okComplete != nil{
                okComplete!()
            }
        })
        alertVC.addAction(alertAction)
        addPopPresenterView(alertVC: alertVC)
        return alertVC
    }


    /// 多个输入框的alertController
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - message: 内容
    ///   - placeholders: 多少个提示文字 代表多少个框
    ///   - okComplete: 回调字符串数组 数组内容顺序是输入框的顺序
    public class func alertInputViews(title: String?,
                                      message: String?,
                                      placeholders: [String]?,
                                      okComplete: @escaping ((_ text: [String]) -> Void)) -> UIAlertController{
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)

        if let placeholderList = placeholders{
            for placeholder in placeholderList{
                alertVC.addTextField { (textField) in
                    textField.placeholder = placeholder
                }
            }
        }

        let okAction = UIAlertAction(title: "确定", style: .default) { (action) in
            if let textFields = alertVC.textFields{
                var inputText: [String] = []
                for textfield in textFields{
                    if let text = textfield.text{
                        inputText.append(text)
                    }
                }
                okComplete(inputText)
            }
        }
        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { (action) in
        }
        alertVC.addAction(okAction)
        alertVC.addAction(cancelAction)
        addPopPresenterView(alertVC: alertVC)
        return alertVC
    }

    /// 适配iPad
    private class func addPopPresenterView(alertVC: UIAlertController){
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
            let popPresenter = alertVC.popoverPresentationController
            if let keywindow = UIApplication.shared.keyWindow{
                popPresenter?.sourceView = keywindow
                if alertVC.preferredStyle == .alert {
                    popPresenter?.sourceRect = CGRect(x: keywindow.bounds.size.width/2, y:keywindow.bounds.size.width/2, width: 0, height: 0)
                }else {
                    popPresenter?.sourceRect = CGRect(x: keywindow.bounds.size.width/2, y: keywindow.bounds.size.height/2, width: 0, height: 0)
                }
                popPresenter?.permittedArrowDirections = []
            }
        }
    }

}
