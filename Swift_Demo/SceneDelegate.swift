//
//  SceneDelegate.swift
//  Swift_Demo
//
//  Created by FCNC05 on 2019/10/28.
//  Copyright © 2019 FCNC05. All rights reserved.
//

import UIKit
import ESTabBarController_swift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        //let tabVC = TabViewController()
//        let navVC = UINavigationController()
//        navVC .addChild(HomePage())
//        self.window?.rootViewController = navVC
//        self.window?.makeKeyAndVisible()
/************************************************/
        let tab = self.customIrregularityStyle(delegate: self as? UITabBarControllerDelegate)
        self.window?.rootViewController = tab
        self.window?.makeKeyAndVisible()

        // 静态图片引导页
        self.setStaticGuidePage()
        // 动态图片引导页
        //self.setDynamicGuidePage()
        // 视频引导页
        //self.setVideoGuidePage()
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func setStaticGuidePage() {
            let imageNameArray: [String] = ["lead01", "lead02", "lead03"]
            let guideView = HHGuidePageHUD.init(imageNameArray: imageNameArray, isHiddenSkipButton: false)
            self.window?.rootViewController?.view.addSubview(guideView)
        }

        func setDynamicGuidePage() {
            let imageNameArray: [String] = ["guideImage6.gif", "guideImage7.gif", "guideImage8.gif"]
            let guideView = HHGuidePageHUD.init(imageNameArray: imageNameArray, isHiddenSkipButton: false)
            self.window?.rootViewController?.view.addSubview(guideView)
        }

        func setVideoGuidePage() {
            let urlStr = Bundle.main.path(forResource: "qidong.mp4", ofType: nil)
            let videoUrl = NSURL.fileURL(withPath: urlStr!)
            let guideView = HHGuidePageHUD.init(videoURL: videoUrl, isHiddenSkipButton: false)
            self.window?.rootViewController?.view.addSubview(guideView)
        }

        // 加载底部tabbar样式
         func customIrregularityStyle(delegate: UITabBarControllerDelegate?) -> ESTabBarController {
            let tabBarController = ESTabBarController()
            tabBarController.delegate = delegate
            tabBarController.title = "Irregularity"
            tabBarController.tabBar.shadowImage = UIImage(named: "transparent")
            tabBarController.shouldHijackHandler = {
                tabbarController, viewController, index in
                if index == 3 {
                    return true
                }
                return false
            }
            tabBarController.didHijackHandler = {
                [weak tabBarController] tabbarController, viewController, index in

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
    //                let vc = FMPlayController()
    //                tabBarController?.present(vc, animated: true, completion: nil)
                }
            }

            let v1 = HomePage()
            let v2 = HomePageTow()
            let v4 = ViewAnimationAndSomeTool()
//            let v4 = FMFindController()
//            let v5 = FMMineController()

            v1.tabBarItem = ESTabBarItem.init(YYIrregularityBasicContentView(), title: "首页", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
            v2.tabBarItem = ESTabBarItem.init(YYIrregularityBasicContentView(), title: "我听", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
 //           v4.tabBarItem = ESTabBarItem.init(YYIrregularityContentView(), title: nil, image: UIImage(named: "tab_play"), selectedImage: UIImage(named: "tab_play"))
            v4.tabBarItem = ESTabBarItem.init(YYIrregularityBasicContentView(), title: "发现", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
//            v5.tabBarItem = ESTabBarItem.init(YYIrregularityBasicContentView(), title: "我的", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
            let n1 = YYNavigationController.init(rootViewController: v1)
            let n2 = YYNavigationController.init(rootViewController: v2)
            let n4 = YYNavigationController.init(rootViewController: v4)
//            let n4 = YYNavigationController.init(rootViewController: v4)
//            let n5 = YYNavigationController.init(rootViewController: v5)
            v1.title = "首页"
            v2.title = "我听"
            //v3.title = "播放"
            v4.title = "发现"
//            v5.title = "我的"

            tabBarController.viewControllers = [n1, n2,n4]
            return tabBarController
        }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

