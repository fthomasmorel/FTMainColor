//
//  FTColorsHelper.swift
//  MainColor
//
//  Created by Florent TM on 29/07/2015.
//  Copyright © 2015 Florent THOMAS MOREL. All rights reserved.
//

import Foundation
import UIKit

func ^ (left: CGFloat, right: CGFloat) -> CGFloat {
    return CGFloat(pow(Double(left), Double(right)))
}

func += (var left: CGFloat, right: CGFloat){
    left = left + right
}
