//
//  AFDate.swift
//  MyStudySwift
//
//  Created by fa on 2018/3/26.
//  Copyright © 2018年 mine. All rights reserved.
//

import Foundation

extension Date{
    // MARK: - 时间戳格式化时间,格式由自己定义
    /**
     * 时间戳格式化
     * param:
     * formatterStyle 目标格式
     * timeInterval   时间戳
     * return String
 **/
    static func stringWithFormatterStyle(formatterStyle: String, timeInterval: TimeInterval) -> String{
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = formatterStyle
        let formatDate = NSNumber.init(value: timeInterval)
        return dateFormatter.string(from: Date.init(timeIntervalSince1970: formatDate.doubleValue/1000))
    }
    // MARK: - 计算距离当前时间的间隔时长---几分钟、几小时、几天...
    /**
     * 计算距离当前时间的间隔时长
     * param:
     * timeInterval 时间戳
     * return String
 **/
    static func intervalTimeFromCurrentDate(timeInterval: TimeInterval) -> String{
        let date = Date.init()
        let intervalTime = date.timeIntervalSince1970
        let sepTime = (intervalTime*1000 - timeInterval)/1000
        if (sepTime < 60) {//一分钟内
            return NSLocalizedString("AFDateFormatter.text1", comment: "")
        } else if (sepTime < 3600) {//一小时内
            return String.init(format: NSLocalizedString("AFDateFormatter.text2", comment: ""), sepTime / 60)
        } else if (sepTime < 86400) {//一天内
            return String.init(format: NSLocalizedString("AFDateFormatter.text3", comment: ""), sepTime / 3600)
        } else if (sepTime < 2592000) {//30天内
            return String.init(format: NSLocalizedString("AFDateFormatter.text4", comment: ""), sepTime / 86400)
        } else if (sepTime < 31536000) {//30天至1年内
            let dateFormatter = DateFormatter.init()
            dateFormatter.dateFormat = NSLocalizedString("AFDateFormatter.text5", comment: "")
            dateFormatter.string(from: Date())
        } else {
            return String.init(format: NSLocalizedString("AFDateFormatter.text6", comment: ""), sepTime / 31536000)
        }
        return ""
    }
}
