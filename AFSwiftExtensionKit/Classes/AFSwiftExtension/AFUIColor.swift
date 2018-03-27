//
//  AFUIColor.swift
//  MyStudySwift
//
//  Created by fa on 2018/1/23.
//  Copyright © 2018年 mine. All rights reserved.
//

import Foundation
import UIKit

// MARK: - 创建构造函数
extension UIColor{
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
    // MARK: - Hex（十六进制转RGB）- 方法1
    public class func hexColor( _ hexValue: String, a: CGFloat ) -> UIColor {
        // 转换为字符
        var cString: String = hexValue.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        
        // 判断字符的长度，小于6个字符，返回默认颜色
        if cString.count < 6 {
            return UIColor.clear
        }
        
        // 判断前缀，并截取前缀
        if cString.hasPrefix("0X") || cString.hasPrefix("0x") {
//            cString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 2))
            cString = String(cString.prefix(through: cString.index(cString.startIndex, offsetBy: 2)))
        }
        if cString.hasPrefix("#") {
//            cString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 1))
            cString = String(cString.prefix(through: cString.index(cString.startIndex, offsetBy: 1)))
        }
        
        // 判断剩余字符的长度，若不是6个字符，返回默认颜色
        if cString.count != 6 {
            return UIColor.clear
        }
        
        // 获取十六进制中代表RGB的字符
        var range: NSRange = NSMakeRange(0, 2)
        let rString = (cString as NSString).substring(with: range)
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        
        // 转换为RGB数值
        var r: UInt64 = 0x0
        var g: UInt64 = 0x0
        var b: UInt64 = 0x0
        Scanner.init(string: rString).scanHexInt64(&r)
        Scanner.init(string: gString).scanHexInt64(&g)
        Scanner.init(string: bString).scanHexInt64(&b)
        
        // 设置RGB颜色
        return UIColor(r: CGFloat(r), g: CGFloat(g), b: CGFloat(b), a: a)
    }
    
    public class func hexColor( _ hexValue: String ) -> UIColor {
        return hexColor(hexValue, a: 1.0)
    }
    
    // MARK: - Hex（十六进制转RGB）- 方法2
    convenience init( hexValue: Int64, a: CGFloat ) {
        let r = ((CGFloat)((hexValue & 0xFF0000) >> 16))/255.0;
        let g = ((CGFloat)((hexValue & 0xFF00) >> 8))/255.0;
        let b = ((CGFloat)(hexValue & 0xFF))/255.0;
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    convenience init( hexValue: Int64 ) {
        self.init(hexValue: hexValue, a: 1.0)
    }
    
    
    // MARK: - 随机颜色值（类方法）
    public class func APRandomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
}
