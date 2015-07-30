//
//  FTMainColor.swift
//  MainColor
//
//  Created by Florent TM on 29/07/2015.
//  Copyright © 2015 Florent THOMAS MOREL. All rights reserved.
//

import Foundation
import UIKit

public func getMainColor(image:UIImage) -> FTColor{
    return getAverageColorForCluster(getClusters(image, withIndice: 500).first!, withImage: image)
}