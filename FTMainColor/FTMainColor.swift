//
//  FTMainColor.swift
//  MainColor
//
//  Created by Florent TM on 29/07/2015.
//  Copyright © 2015 Florent THOMAS MOREL. All rights reserved.
//

import Foundation
import UIKit

func getMainColor(image:UIImage, withIndice k:Int) -> FTColor{
    return getAverageColorForCluster(getClusters(image, withIndice: k).first!, withImage: image)
}