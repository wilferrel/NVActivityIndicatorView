//
//  NVActivityIndicatorAnimationBallPulse.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Nguyen Vinh on 7/23/15.
//  Copyright (c) 2015 Nguyen Vinh. All rights reserved.
//

import UIKit

class NVActivityIndicatorAnimationBallPulse: NVActivityIndicatorAnimationDelegate {
    func setUpAnimationInLayer(layer: CALayer, size: CGSize, color: UIColor) {
        let circleSpacing: CGFloat = 2
        let circleSize: CGFloat = (size.width - 2 * circleSpacing) / 3
        let x: CGFloat = (layer.bounds.size.width - size.width) / 2
        let y: CGFloat = (layer.bounds.size.height - circleSize) / 2
        let duration: CFTimeInterval = 0.75
        let beginTime = CACurrentMediaTime()
        let beginTimes: [CFTimeInterval] = [0.12, 0.24, 0.36]
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.2, 0.68, 0.18, 1.08)
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        
        // Animation
        animation.keyTimes = [0, 0.3, 1]
        animation.timingFunctions = [timingFunction, timingFunction]
        animation.values = [1, 0.3, 1]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.removedOnCompletion = false
        
        // Draw circles
        for var i = 0; i < 3; i++ {
            let circle = NVActivityIndicatorShape.Circle.createLayerWith(size: CGSize(width: circleSize, height: circleSize), color: color)
            let frame = CGRect(x: x + circleSize * CGFloat(i) + circleSpacing * CGFloat(i),
                y: y,
                width: circleSize,
                height: circleSize)
            
            circle.frame = frame
            animation.beginTime = beginTime + beginTimes[i]
            circle.addAnimation(animation, forKey: "animation")
            layer.addSublayer(circle)
        }
    }
}