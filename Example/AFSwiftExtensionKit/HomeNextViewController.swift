//
//  HomeNextViewController.swift
//  AFSwiftExtensionKit_Example
//
//  Created by fa on 2018/3/28.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit

class HomeNextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.red
        
        // MARK: - 拦截返回事件
        let nav: AFNavigationController = self.navigationController as! AFNavigationController
        nav.addObserverBackBlock { () -> Bool in
            self.backClickEvent()
            //            return false  //点击返回按钮不pop
            return true
        }
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
extension HomeNextViewController{
    func backClickEvent(){
        print("拦截返回事件:点击返回按钮后需要的操作")
    }
}
