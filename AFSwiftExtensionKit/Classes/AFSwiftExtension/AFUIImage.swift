//
//  AFUIImage.swift
//  MyStudySwift
//
//  Created by fa on 2018/1/18.
//  Copyright © 2018年 mine. All rights reserved.
//

import Foundation
import UIKit

extension UIImage{
    // MARK: - 图片适配
    public class func reScaleImage(image: UIImage, size: CGSize) -> (UIImage){
        var tempImage: UIImage? = nil
        let tempSize = image.size
        let tempWidth = tempSize.width
        let tempHeight = tempSize.height
        let actWidth = size.width
        let actHeight = size.height == 0 ? tempHeight / (tempWidth / actWidth) : size.height
        var scaleFactor: CGFloat = 0.0
        var scaleWidth = actWidth
        var scaleHeight = actHeight
        // MARK: - 判断原图片大小是否与目标图片大小相等
        if __CGSizeEqualToSize(tempSize, size) == false{
            let widthFactor = actWidth / tempWidth
            let heightFactor = actHeight / tempHeight
            // MARK: - 判断图片是横向还是竖向还是相等
            if widthFactor > heightFactor{
                scaleFactor = widthFactor
            }else{
                scaleFactor = heightFactor
            }
            scaleWidth = tempWidth * scaleFactor
            scaleHeight = tempHeight * scaleFactor
            if scaleHeight > actHeight{
                scaleWidth = scaleWidth * actHeight / scaleHeight
                scaleHeight = actHeight
            }
            tempImage = reScaleImageToSize(image: image, size: CGSize(width: scaleWidth, height: scaleHeight))
        }
        
        return tempImage ?? image
        
    }
    public class func reScaleImageToSize(image: UIImage, size: CGSize) ->(UIImage){
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let tempImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return tempImage
    }
}
