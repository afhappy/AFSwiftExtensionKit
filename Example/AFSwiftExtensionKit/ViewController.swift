//
//  ViewController.swift
//  AFSwiftExtensionKit
//
//  Created by afhappy on 03/28/2018.
//  Copyright (c) 2018 afhappy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "首页"
        colorExample()
        imageExample()
        dateFormatExample(timeInterval: 1521792251000)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.pushViewController(HomeNextViewController(), animated: true)
    }

}
extension ViewController{
    // MARK: - UIColor的便利构造函数
    func colorExample() {
        let colorTestView = UIView(frame: CGRect(x: 10, y: 100, width: 100, height: 100))
        colorTestView.backgroundColor = UIColor.init(r: 100, g: 100, b: 100)
        view.addSubview(colorTestView)
    }
    // MARK: - UIImage自适应
    func imageExample(){
        let imageView = UIImageView(frame: CGRect(x: 20, y: 300, width: 186, height: 116))
        let image = UIImage(named: "testImage")
        imageView.image = UIImage.reScaleImage(image: image!, size: imageView.bounds.size)
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        view.addSubview(imageView)
    }
    // MARK: - 时间格式化
    func dateFormatExample(timeInterval: CGFloat) {
        //            时间戳转字符串
        let dateString = Date.stringWithFormatterStyle(formatterStyle: "yyyy-MM-dd HH:mm:ss", timeInterval: timeInterval)
        print(dateString)
        
        //            根据时间戳计算时间间隔
        let sepTime = Date.intervalTimeFromCurrentDate(timeInterval: timeInterval)
        print(sepTime)
    }
}

