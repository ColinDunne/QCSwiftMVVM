//
//  QCMainViewController.swift
//  QCSwiftMVVM
//
//  Created by Qian Chen on 2019/8/11.
//  Copyright © 2019 Qian Chen. All rights reserved.
//

import UIKit

class QCMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension QCMainViewController {
    
    fileprivate func setupChildControllers() {
        
        let infoArray = [
            ["className": "QCAViewController", "title": "首页", "imageName": "home"],
            ["className": "QCBViewController", "title": "消息", "imageName": "message"],
            ["className": "QCCViewController", "title": "发现", "imageName": "discover"],
            ["className": "QCDViewController", "title": "我的", "imageName": "profile"]
        ]
        var controllerArray = [UIViewController]()
        for dict in infoArray {
            controllerArray.append(controller(dict: dict))
        }
        viewControllers = controllerArray
    }
    
    private func controller(dict: [String: String]) -> UIViewController {
        guard let className = dict["className"],
            let title = dict["title"],
            let imageName = dict["imageName"],
            let cls = NSClassFromString(className) as? UIViewController.Type
        else {
            return UIViewController()
        }
        
        // 创建ViewController
        let viewController = cls.init()
        viewController.title = title
        
        viewController.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        viewController.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")
        viewController.tabBarItem.title = title
//        viewController.tabBarItem.setTitleTextAttributes([NSColor], for: .selected)
        
        let naviController = QCNavigationController(rootViewController: viewController)
        
        return naviController
    }
}
