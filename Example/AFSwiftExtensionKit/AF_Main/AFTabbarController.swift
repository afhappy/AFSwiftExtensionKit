//
//  AFTabbarController.swift
//  AFSwiftExtensionKit
//
//  Created by fa on 2018/2/23.
//  Copyright © 2018年 mine. All rights reserved.
//

import UIKit

class AFTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
extension AFTabbarController{
    func setupUI() {
        let firstVC = AFNavigationController(rootViewController: ViewController())
        firstVC.tabBarItem.title = "首页"
        firstVC.tabBarItem.image = UIImage(named: "首页")?.withRenderingMode(.alwaysOriginal)
        firstVC.tabBarItem.selectedImage = UIImage(named: "首页_sel")?.withRenderingMode(.alwaysOriginal)
        
        let secondVC = AFNavigationController(rootViewController: MineViewController())
        secondVC.tabBarItem.title = "我的"
        secondVC.tabBarItem.image = UIImage(named: "我的")?.withRenderingMode(.alwaysOriginal)
        secondVC.tabBarItem.selectedImage = UIImage(named: "我的_sel")?.withRenderingMode(.alwaysOriginal)
        
        self.viewControllers = [firstVC,secondVC]
    }
}
