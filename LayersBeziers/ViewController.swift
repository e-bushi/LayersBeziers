//
//  ViewController.swift
//  LayersBeziers
//
//  Created by Chris Mauldin on 5/7/18.
//  Copyright © 2018 Chris Mauldin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var rectShape = CAShapeLayer()
    var numberOfRects = 7
    var width = CGFloat(20)
    var height = CGFloat(20)
    var xPos = 10
    var yPos = 10
    var hue = CGFloat(1)
    var satu = CGFloat(1)
    var brightness = CGFloat(1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        for _ in 1...numberOfRects {
            let shape = CAShapeLayer()
            print(shape)
            let color = UIColor(hue: hue, saturation: satu, brightness: brightness, alpha: 1).cgColor
            createRectLayer(width, height, xPos, yPos, color, shapelayer: shape)
            width += CGFloat(20)
            height += CGFloat(20)
            xPos += 10
            yPos += 10
            print(satu)
            satu -= CGFloat(0.125)
            
        }
    }
    
    func createRectLayer(_ width: CGFloat, _ height: CGFloat, _ xPosition: Int, _ yPosition: Int, _ color: CGColor, shapelayer: CAShapeLayer) {
        
        let size = CGSize(width: view.bounds.width - width, height: view.bounds.height - height)
        let point = CGPoint(x: xPosition, y: yPosition)
        let rect = CGRect(origin: point, size: size)
        shapelayer.path = UIBezierPath(roundedRect: rect, cornerRadius: 10.0).cgPath
        shapelayer.strokeColor = UIColor.clear.cgColor
        shapelayer.lineWidth = 1
        shapelayer.fillColor = color
        view.layer.addSublayer(shapelayer)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}





