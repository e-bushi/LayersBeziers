//
//  SkylineViewController.swift
//  LayersBeziers
//
//  Created by Chris Mauldin on 5/8/18.
//  Copyright © 2018 Chris Mauldin. All rights reserved.
//

import UIKit

class SkylineViewController: UIViewController {
    
    var sunLayer = CAShapeLayer()
    var gradientLayer = CAGradientLayer()
    
    var groundLayer = CAShapeLayer()

    
    var groundOverlayLayer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createGradientLayer(gradientLayer)
        createSunLayer(sunLayer)
        createGroundLayer(groundLayer, saturation: 0.5, controlPointFour: 40)
        createGroundLayer(groundOverlayLayer, saturation: 0.7, controlPointFour: 20)
        
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension SkylineViewController {
    
    func createSunLayer(_ shape: CAShapeLayer) {
        let point = CGPoint(x: view.center.x * 1.5, y: view.center.y * 0.5)
        let path = UIBezierPath(arcCenter: .zero, radius: 70.0, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        shape.path = path.cgPath
        shape.strokeColor = UIColor.clear.cgColor
        shape.lineWidth = 1
        shape.fillColor = UIColor(hue: 0.15, saturation: 0.7, brightness: 1.0, alpha: 1).cgColor
        shape.position = point
        view.layer.addSublayer(shape)
    }
    
    func createGradientLayer(_ backgroundLayer: CAGradientLayer) {
        let rect = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        let bgView = UIView(frame: rect)
        
        let firstColor = UIColor(hue: 0.4, saturation: 0.2, brightness: 1, alpha: 1)
        let secondColor = UIColor(hue: 0.4, saturation: 0.4, brightness: 1, alpha: 1)
        let thirdColor = UIColor(hue: 0.4, saturation: 0.7, brightness: 1, alpha: 1)
        
        let colors = [firstColor.cgColor, secondColor.cgColor, thirdColor.cgColor]
        backgroundLayer.colors = colors

        backgroundLayer.frame = bgView.bounds
        
        bgView.layer.addSublayer(backgroundLayer)
        view.addSubview(bgView)
    }
    
    func createGroundLayer(_ Layer: CAShapeLayer, saturation: CGFloat, controlPointFour: Int) {
        let path = UIBezierPath()
        let startPoint = CGPoint(x: 0, y: view.center.y)
        let middlePoint = CGPoint(x: view.center.x, y: view.center.y + (view.center.y * 0.2))
        let rightPoint = CGPoint(x: view.center.x + view.center.x, y: view.center.y - CGFloat(controlPointFour+10))
        
        
        let cpOne = CGPoint(x: (view.center.x * 0.5), y: view.center.y)
        let cpTwo = CGPoint(x: (view.center.x * 0.5), y: view.center.y + (view.center.y * 0.2))
        
        let cpThree = CGPoint(x: view.center.x + (view.center.x * 0.5), y: view.center.y + (view.center.y * 0.2))
        let cpFour = CGPoint(x: view.center.x + (view.center.x * 0.5), y: view.center.y - CGFloat(controlPointFour))
        
        path.move(to: startPoint)
        path.addCurve(to: middlePoint, controlPoint1: cpOne, controlPoint2: cpTwo)
        path.addCurve(to: rightPoint, controlPoint1: cpThree, controlPoint2: cpFour)
        path.addLine(to: CGPoint(x: view.bounds.maxX, y: view.bounds.maxY))
        path.addLine(to: CGPoint(x: view.bounds.minX, y: view.bounds.maxY))
        path.close()
        
        
        Layer.fillColor = UIColor(hue: 0.1, saturation: saturation, brightness: 1.0, alpha: 1).cgColor
        path.fill()
        
        Layer.path = path.cgPath
        view.layer.addSublayer(Layer)

    }
}
