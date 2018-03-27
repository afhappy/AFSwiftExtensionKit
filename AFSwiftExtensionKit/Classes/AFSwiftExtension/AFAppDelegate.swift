//
//  AFAppDelegate.swift
//  MyStudySwift
//
//  Created by fa on 2018/2/23.
//  Copyright © 2018年 mine. All rights reserved.
//

import Foundation

/**
 * 导航栏样式
 **/
public struct AFNavStyle {
//    导航栏颜色
    public var foregroundColor: UIColor?
//    导航栏字体
    public var font: UIFont?
//
    public var tintColor: UIColor?
    
    public init(foregroundColor: UIColor?, font: UIFont?, tintColor: UIColor?){
        self.foregroundColor = foregroundColor
        self.font = font
        self.tintColor = tintColor
    }
}
/**
 * tabbar样式
 **/
public struct AFTabbarStyle {
//    tabbar正常模式字体大小
    public var normalFont: UIFont?
//    tabbar正常模式颜色
    public var normalForegroundColor: UIColor?
//    tabbar选中模式字体大小
    public var selectFont: UIFont?
//    tabbar选中模式颜色
    public var selectForegroundColor: UIColor?
    
    
    public init(normalFont: UIFont?, normalForegroundColor: UIColor?, selectFont: UIFont?, selectForegroundColor: UIColor?){
        self.normalFont = normalFont
        self.normalForegroundColor = normalForegroundColor
        self.selectFont = selectFont
        self.selectForegroundColor = selectForegroundColor
    }
}
public class AFAppDelegate: NSObject {
    // MARK: - 单例
    public static let singleton: AFAppDelegate = AFAppDelegate()
    private override init() {
        
    }
}
extension AFAppDelegate{
    public func appearance(navStyle: AFNavStyle, tabbarStyle: AFTabbarStyle){
        // MARK: - 设置nav样式
        let navBar = UINavigationBar.appearance()
        // MARK: - 设置标题文字颜色
        var navAttrs: [NSAttributedStringKey: Any] = Dictionary()
        if navStyle.foregroundColor != nil {
            navAttrs[NSAttributedStringKey.foregroundColor] = navStyle.foregroundColor
        }
        if navStyle.font != nil{
            navAttrs[NSAttributedStringKey.font] = navStyle.font
        }
        navBar.titleTextAttributes = navAttrs
        // MARK: - 修改导航栏自带返回按钮的颜色
        if navStyle.tintColor != nil {
            navBar.tintColor = navStyle.tintColor
        }
        // MARK: - 设置背景颜色
//        let bgImage = UIImage(named: "")
//        navBar.setBackgroundImage(bgImage, for: .default)
        
        
        // MARK: - 设置tabbar样式
        let tabbarItem = UITabBarItem.appearance()
        // MARK: - 设置文字颜色
        var tabAttrs: [NSAttributedStringKey: Any] = Dictionary()
        if tabbarStyle.normalForegroundColor != nil {
            tabAttrs[NSAttributedStringKey.foregroundColor] = tabbarStyle.normalForegroundColor
        }
        if tabbarStyle.normalFont != nil {
            tabAttrs[NSAttributedStringKey.font] = tabbarStyle.normalFont
        }
        tabbarItem.setTitleTextAttributes(tabAttrs, for: .normal)
        
        var selTabAttrs: [NSAttributedStringKey: Any] = Dictionary()
        if tabbarStyle.selectForegroundColor != nil {
            selTabAttrs[NSAttributedStringKey.foregroundColor] = tabbarStyle.selectForegroundColor
        }
        if tabbarStyle.selectFont != nil {
            selTabAttrs[NSAttributedStringKey.font] = tabbarStyle.normalFont
        }
        tabbarItem.setTitleTextAttributes(selTabAttrs, for: .selected)
    }
}
