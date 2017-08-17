//
//  AHProgressView.swift
//  AHProgress
//
//  Created by Andy Tong on 8/13/17.
//  Copyright © 2017 Andy Tong. All rights reserved.
//

import UIKit

public class AHProgressView: UIView {
    let path = UIBezierPath()
    public var progress: CGFloat = 0.7 {
        didSet {
            guard progress >= 0.0 && progress <= 1.0 else{
                progress = oldValue
                return
            }
            progressLayer.strokeEnd = progress

        }
        
    }
    
    public var progressTintColor = UIColor.gray {
        didSet {
            progressLayer.strokeColor = progressTintColor.cgColor
        }
    }
    public var trackTintColor = UIColor.black {
        didSet {
            backgroundColor = trackTintColor
        }
    }
    public lazy var progressLayer: CAShapeLayer = {
        let line = CAShapeLayer()
        line.strokeColor = self.progressTintColor.cgColor
        line.strokeStart = 0
        line.strokeEnd = self.progress
        line.lineCap = kCALineCapSquare
        return line
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = trackTintColor
        layer.addSublayer(progressLayer)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = trackTintColor
        layer.addSublayer(progressLayer)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        path.removeAllPoints()
        let offset = self.bounds.height * 0.5
        path.move(to: CGPoint(x: offset, y: offset))
        path.addLine(to: CGPoint(x: self.bounds.width - offset, y: offset))
        progressLayer.frame = self.bounds
        progressLayer.lineWidth = self.bounds.height
        progressLayer.path = path.cgPath
    }
    
}
