//
//  AHProgressSlider.swift
//  AHProgress
//
//  Created by Andy Tong on 8/13/17.
//  Copyright © 2017 Andy Tong. All rights reserved.
//

import UIKit

public class AHProgressSlider: UISlider {
    public var trackHeight: CGFloat = 2.0 {
        didSet {
            layoutIfNeeded()
        }
    }
    
    public var loadedProgressTintColor = UIColor.gray {
        didSet {
            self.progressView.progressTintColor = loadedProgressTintColor
        }
    }
    
    public var loadedProgress: CGFloat {
        set {
            guard newValue >= 0.0 && newValue <= 1.0 else{
                return
            }
            self.progressView.progress = newValue
        }
        
        get {
            return self.progressView.progress
        }
    }
    
    private weak var progressView: AHProgressView!
    
    /// the offset for progressView to match minimumValueImage's left edge
    private let offset: CGFloat = 3.0
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        let progressView = AHProgressView()
        insertSubview(progressView, at: 0)
        self.progressView = progressView
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let progressView = AHProgressView()
        insertSubview(progressView, at: 0)
        self.progressView = progressView
    }

    
    open override func trackRect(forBounds bounds: CGRect) -> CGRect{
        var newBounds = super.trackRect(forBounds: bounds)
        newBounds.size.height = trackHeight
        return newBounds
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        
        let offset = max(self.trackHeight * 0.5, self.offset)
        
        self.progressView.frame.size = CGSize(width: self.bounds.width - offset * 2 , height: self.trackHeight)
        self.progressView.center = CGPoint(x: self.bounds.width * 0.5, y: self.bounds.height * 0.5)
        
        // Setting everything ccentral
        for view in self.subviews {
            if view.isKind(of: UIImageView.self){
                view.center.y = self.bounds.height * 0.5
            }
        }
        
    }
}












