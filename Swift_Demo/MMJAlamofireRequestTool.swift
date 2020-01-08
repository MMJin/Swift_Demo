//
//  MMJAlamofireRequestTool.swift
//  Swift_Demo
//
//  Created by FCNC05 on 2019/12/17.
//  Copyright © 2019 FCNC05. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

//定义返回的闭包
typealias ReqRsponseSuccess  = (_ response:AnyObject)->Void //无返回值 闭包内携带参数为任意类型
typealias ReqRsponseFail = (_ erroe:AnyObject)->Void
typealias NetWorkStatus = (_ HTNetworkStatus :Int32)-> Void

//定义枚举类型
@objc enum HTNetworkStatus : Int32 {
    case HttpUnKnow = -1//未知
    case HttpNoReachable = 0//无网络
    case HttpWwan = 1//2g，3g，4g
    case HttpWifi = 2//wifi
}
//结构体
struct HttpApi {
    //设置公共域名或者IP
    static let hostName = ""
}
//枚举
enum methodType {
    case RequestMethodGet
    case RequestMethodPost
}
class HttpNetWorkRequest: NSObject {
   //创建类的实例变量//let是线程安全的//对于单例类来说需要创建唯一对外输出的实例方法
    //静态变量用static来处理
    static let singleton = HttpNetWorkRequest()
    ///当前网络状态 默认
    var htNetworkStatus: HTNetworkStatus = HTNetworkStatus.HttpWifi
    //
    public func getRequestWith(url:String,params:[String: Any]?, success:@escaping ReqRsponseSuccess,error:@escaping ReqRsponseFail){
        //jsonEncoding.default 是放在body体内的 比如post请求
        //2、URLEncoding.default 在GET中是拼接地址的，    比如get请求
        //3、URLEncoding(destination: .methodDependent)是自定义的URLEncoding，methodDependent的值如果是在GET 、HEAD 、DELETE中就是拼接地址的。其他方法方式是放在httpBody内的。
        //4、URLEncoding(destination: .httpbody)是放在httpbody内的
        Alamofire.request(url, method: .get, parameters: params, encoding:URLEncoding.default, headers: nil).responseJSON { (response) in
                    switch response.result{
                    case .success:
                        if let value = response.result.value as? [String: Any]{
                            success(value as AnyObject)
                        }
                        break

                    case .failure(let err):
                         error(err as AnyObject)
                        break
                    }
                }
            }
     public func postRequestWith(url: String,
                                   params:[String: Any]?,
                                   success:@escaping ReqRsponseSuccess,
                                   error:@escaping ReqRsponseFail){

            Alamofire.request(url, method: .post, parameters: params, encoding:URLEncoding.default, headers: nil).responseJSON { (response) in
                switch response.result{
                case .success:
                    if let value = response.result.value as? [String: Any]{
                        success(value as AnyObject)
                    }
                    break

                case .failure(let err):
                    error(err as AnyObject)
                    break
                }

            }


        }

        public func requestWith(url:String,
                                  httpMethod: Int32,
                                  params:[String: Any]?,
                                  success:@escaping ReqRsponseSuccess,
                                  error:@escaping ReqRsponseFail){

            let  httpUrl = HttpApi.hostName + url

    // 设置公共请求参数
            var updict = params
            let token = UserDefaults.standard.string(forKey: "token")
            if  token != nil {
                updict?["access_token"] = token
            }
            updict?["IOS"] = "app_os"
            updict?["app_version"] = "1.0"
            updict?["device_id"] = UIDevice.current.identifierForVendor?.uuidString

            switch httpMethod {
            case 0:
             getRequestWith(url: httpUrl, params: updict, success: success, error: error)

            case 1:
             postRequestWith(url: httpUrl, params: updict, success: success, error: error)

            default:
              break

            }
        }

        //切记私有化初始化方法，防止外部通过init直接创建实例。
        private override init() {

        }

}



//类扩展 方法
extension HttpNetWorkRequest {

    public func monitoringNetWork (netStatus:@escaping NetWorkStatus){
        let reachability = NetworkReachabilityManager()
        reachability?.startListening()//开始监听网络变化
        reachability?.listener = { [weak self] status in
            //守护，断言
            guard let weakSelf = self else {
                return
            }
            //?? 空和运算符 表示 reachability?.isReachable 没有网 则weifalse
            if reachability?.isReachable ?? false {
                switch status {
                case .notReachable:
                     weakSelf.htNetworkStatus = HTNetworkStatus.HttpNoReachable
                case .unknown:
                    weakSelf.htNetworkStatus = HTNetworkStatus.HttpUnKnow
                case .reachable(.wwan):
                    weakSelf.htNetworkStatus = HTNetworkStatus.HttpWwan
                case .reachable(.ethernetOrWiFi):
                    weakSelf.htNetworkStatus = HTNetworkStatus.HttpWifi
                }
            }
            else {
                    weakSelf.htNetworkStatus = HTNetworkStatus.HttpNoReachable
                }
//网络状态返回
            netStatus(weakSelf.htNetworkStatus.rawValue)
        }

    }
    public func monitoringDataFormLocalWhenNetChanged() {
        self.monitoringNetWork{ (_) in

        }
    }

}
////let dictionary = ["phone":""
//                          "password":""]
//    HttpNetWork.singleton.requestWith(url: "请求链接", httpMethod: 0, params: dictionary, success: { (response) in
//        //swiftJSON 做josn解析
//        let jsonDict = JSON(response)
//        print("返回结果：\(jsonDict)")
//
//        if  jsonDict["c"].intValue == 0 {
//            let model = UserModel.init(fromJson: jsonDict["d"])
//            UserDefaults.standard.set(model.accessToken, forKey: "token")
//       print("返回结果：\(model)")
//
//}


