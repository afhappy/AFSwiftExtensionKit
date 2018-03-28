//
//  AFNavigationController.swift
//  AFSwiftExtensionKit
//
//  Created by fa on 2018/2/23.
//  Copyright © 2018年 mine. All rights reserved.
//

import UIKit

class AFNavigationController: UINavigationController {
    
    //格式: typealias 闭包名称 = (参数名称: 参数类型) -> 返回值类型
    typealias backBlock = () -> Bool
    var navBackBlock: backBlock?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - 拦截push进来的控制器
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        // MARK: - 判断是否为根控制器
        if self.viewControllers.count > 0 {
//            显示隐藏tabbar
            viewController.hidesBottomBarWhenPushed = true
//            设置导航栏---自定义返回键
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.customBarButtonItem(target: self, action: #selector(back(item:)), image: UIImage.init(named: "navBack")!, highImage: UIImage.init(named: "navBack")!)
        }
        
        super.pushViewController(viewController, animated: animated)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension AFNavigationController{
    @objc func back(item: UIButton) {
//         && self.viewControllers.last?.navigationItem.leftBarButtonItem == item
        if (navBackBlock != nil) {
            if (navBackBlock!()) {
                self.popViewController(animated: true);
            }
        }else{
            self.popViewController(animated: true);
        }
    }
    public func addObserverBackBlock(block: @escaping backBlock){
        
        navBackBlock = block
    
    }
}
