//
//  FTCluster.swift
//  MainColor
//
//  Created by Florent TM on 29/07/2015.
//  Copyright © 2015 Florent THOMAS MOREL. All rights reserved.
//

import Foundation
import UIKit


struct Cluster {
    var color:FTColor!
    var points:[CGPoint]!
}

func getClusterClosestOfColor(color:FTColor, withClusters clusters:[Cluster]) -> Int {
    var index = 0
    var d = CGFloat.max
    
    for i in 0 ... clusters.count-1{
        let cluster = clusters[i]
        let tmp = getDistanceBetweenColor(cluster.color, color2: color)
        if d > tmp {
            d = tmp
            index = i
        }
    }
    return index
}


func getAverageColorForCluster(cluster:Cluster, withImage image:UIImage) -> FTColor{
    
    let colors:[FTColor] = cluster.points.map { (point) -> FTColor in
        getPixelColor(image, pos: point)
    }
    return getAverageColorForColors(colors)
}

func getClusters(image:UIImage, withIndice k:Int) -> [Cluster]{
    var clusters:Array<Cluster> = []
    for _ in 1 ... k{
        let x = Int(arc4random_uniform(UInt32(image.size.width)))
        let y = Int(arc4random_uniform(UInt32(image.size.height)))
        let point = CGPoint(x: x, y: y)
        let cluster = Cluster(color: getPixelColor(image, pos: point), points: [point])
        clusters.append(cluster)
    }
    
    let limit = Int(max(image.size.width, image.size.height))
    
    for _ in 1 ... limit{
        let x = Int(arc4random_uniform(UInt32(image.size.width)))
        let y = Int(arc4random_uniform(UInt32(image.size.height)))
        let point = CGPoint(x: x, y: y)
        let color = getPixelColor(image, pos: point)
        clusters[getClusterClosestOfColor(color, withClusters: clusters)].points.append(point)
    }
    
    clusters.sortInPlace { (c1, c2) -> Bool in
        c1.points.count > c2.points.count
    }
    return clusters
}
