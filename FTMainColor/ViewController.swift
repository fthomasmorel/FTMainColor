//
//  ViewController.swift
//  FTMainColor
//
//  Created by Florent TM on 29/07/2015.
//  Copyright © 2015 Florent THOMAS-MOREL. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.startSearching()
    }
    
    override func viewWillAppear(animated: Bool) {

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func startSearching() {
        let color = getMainColor(imageView.image!, withIndice: 300)
        let opaqueColor = color.getUIColor()
        let transColor = UIColor(red: color.red, green: color.green, blue: color.blue, alpha: 0)
        
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [opaqueColor.CGColor, transColor.CGColor]
        gradient.locations = [0 , 1]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 0.1)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: imageView.frame.size.width, height: imageView.frame.size.height)
        
        imageView.layer.insertSublayer(gradient, atIndex: 0)
        self.view.backgroundColor = opaqueColor
        
    }
    
}

