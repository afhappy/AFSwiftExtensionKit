//
//  AFUIBarButtonItem.swift
//  MyStudySwift
//
//  Created by fa on 2018/2/24.
//  Copyright © 2018年 mine. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem{
    class func customBarButtonItem(target: Any, action: Selector, image: UIImage, highImage: UIImage) -> (UIBarButtonItem){
        let button = UIButton(type: .custom)
        button.frame.size = CGSize(width: 44, height: 44)
        button.addTarget(target, action: action, for: .touchUpInside)
        button.setImage(image, for: .normal)
        button.setImage(highImage, for: .highlighted)
        button.contentHorizontalAlignment = .left
        
        return UIBarButtonItem(customView: button)
    }
}
