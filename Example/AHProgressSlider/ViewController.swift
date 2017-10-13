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
    @IBAction func sliderTouchDown(_ sender: AHProgressSlider) {
        print("sliderTouchDown")
    }
    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        slider.maximumTrackTintColor = UIColor.clear
        slider.minimumTrackTintColor = UIColor.red
        let thumbImg = UIImage(named: "player-thumb")
        slider.setThumbImage(thumbImg, for: .normal)
        /// Default is gray too.
        self.slider.loadedProgressTintColor = UIColor.green
        slider.trackHeight = 2.0
        slider.value = 0.3
        slider.loadedProgress = 0.0
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        timer = Timer(timeInterval: 0.1, target: self, selector: #selector(fireTimer(_:)), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .commonModes)
    }
    
    func fireTimer(_ timer: Timer) {
        guard self.slider.loadedProgress < 0.99 else {
            timer.invalidate()
            self.slider.loadedProgress = 1.0
            return
        }
        
        self.slider.loadedProgress += 0.01
    }
    
}






