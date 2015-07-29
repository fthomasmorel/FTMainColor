//
//  FTColor.swift
//  MainColor
//
//  Created by Florent TM on 29/07/2015.
//  Copyright © 2015 Florent THOMAS MOREL. All rights reserved.
//

import Foundation
import UIKit

public struct FTColor {
    public var red:CGFloat!
    public var green:CGFloat!
    public var blue:CGFloat!
    
    public func getUIColor() -> UIColor{
        return UIColor(red: self.red, green: self.green, blue: self.blue, alpha: CGFloat(1))
    }
}


func getPixelColor(image:UIImage, pos: CGPoint) -> FTColor {
    let pixelData = CGDataProviderCopyData(CGImageGetDataProvider(image.CGImage))
    let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
    
    let pixelInfo: Int = ((Int(image.size.width) * Int(pos.y)) + Int(pos.x)) * 4
    
    let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
    let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
    let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
    
    return FTColor(red: r, green: g, blue: b)
}


func getDistanceBetweenColor(color1:FTColor, color2:FTColor) -> CGFloat{
    let r1 = color1.red
    let b1 = color1.blue
    let g1 = color1.green
    
    let r2 = color2.red
    let b2 = color2.blue
    let g2 = color2.green
    
    let sum = (r1 - r2)^2
    sum += ((b1 - b2)^2)
    sum += ((g1 - g2)^2)
    return CGFloat(sqrt(Double(sum)))
}


func getAverageColorForColors(colors:[FTColor]) -> FTColor {
    var color = FTColor(red: 0, green: 0, blue: 0)
    colors.map { (c) -> Void in
        color.red = color.red + c.red
        color.blue = color.blue + c.blue
        color.green = color.green + c.green
    }
    color.red = color.red/CGFloat(colors.count)
    color.blue = color.blue/CGFloat(colors.count)
    color.green = color.green/CGFloat(colors.count)
    
    return color
}