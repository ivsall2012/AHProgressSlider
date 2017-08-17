//
//  ViewController.swift
//  AHProgress
//
//  Created by Andy Tong on 8/13/17.
//  Copyright © 2017 Andy Tong. All rights reserved.
//

import UIKit
import QuartzCore
import AHProgressSlider

class ViewController: UIViewController {
    @IBOutlet weak var slider: AHProgressSlider!
    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        slider.maximumTrackTintColor = UIColor.clear
        slider.minimumTrackTintColor = UIColor.red
        let thumbImg = UIImage(named: "player-thumb")
        slider.setThumbImage(thumbImg, for: .normal)
//        let img = circle(diameter: 20.0, color: .orange)
//        slider.setThumbImage(img, for: .normal)
        slider.trackHeight = 5.0
        slider.value = 0.3
        slider.loadedProgress = 0.0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        timer = Timer(timeInterval: 1, target: self, selector: #selector(fireTimer(_:)), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .commonModes)
        
    }
    func fireTimer(_ timer: Timer) {
        guard self.slider.loadedProgress <= 0.7 else {
            timer.invalidate()
            return
        }
        
        self.slider.loadedProgress += 0.1
    }
    
    func circle(diameter: CGFloat, color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: diameter, height: diameter), false, 0)
        let ctx = UIGraphicsGetCurrentContext()!
        ctx.saveGState()
        
        let rect = CGRect(x: 0, y: 0, width: diameter, height: diameter)
        ctx.setFillColor(color.cgColor)
        ctx.fillEllipse(in: rect)
        ctx.setShadow(offset: CGSize(width: 10, height: 10), blur: 3.0)
        ctx.restoreGState()
        let img = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return img
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //        let center = CGPoint(x: 200, y: 200)
        //        let circle = CAShapeLayer()
        //        let circlePath = UIBezierPath(arcCenter: center, radius: 150.0, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true).cgPath
        //        circle.path = circlePath
        //        circle.strokeColor = UIColor.black.cgColor
        //        circle.lineWidth = 8.0
        //        circle.fillColor = UIColor.clear.cgColor
        //
        //        self.view.layer.addSublayer(circle)
        //
        //        let drawAniamtion = CABasicAnimation(keyPath: "strokeEnd")
        //        drawAniamtion.duration = 10.0
        //        drawAniamtion.repeatCount = 5.0
        //        drawAniamtion.isRemovedOnCompletion = false
        //        drawAniamtion.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        //        drawAniamtion.fromValue = 0.0
        //        drawAniamtion.toValue = 1.0
        //        circle.add(drawAniamtion, forKey: "drawCircleAnimation")
    }
    
    
}






