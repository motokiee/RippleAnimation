//
//  RippleAnimation.swift
//  RippleAnimationView
//
//  Created by Motoki on 2015/12/22.
//  Copyright (c) 2015 MotokiNarita. All rights reserved.
//

import UIKit

private let DefaultScalingAnimateDuration: NSTimeInterval = 1.0
private let DefaultAlphaAnimateDuration: NSTimeInterval   = 0.2
private let DefaultScale: CGFloat = 100

// MARK: - UIView - Ripple Animation Extension
public extension UIView {

    /**
     Adds a ripple animation to UIView instance
     
     - parameter color:                The color of ripple view.
     - parameter completionHandler:    A closure to be executed when the animation sequence ends
     */
    public func rippleAnimate(color color: UIColor, completionHandler: (() -> Void)?) {
        let startRect = CGRectMake(0, 0, self.frame.width, self.frame.height)
        self.rippleAnimate(color: color, scale: DefaultScale, startRect: startRect, scaleAnimateDuration: DefaultScalingAnimateDuration, fadeAnimateDuration: DefaultAlphaAnimateDuration, completionHandler: completionHandler)
    }


    /**
     Adds a ripple effects to UIView instance with detail parameters
     
     - parameter color:                The color of ripple view.
     - parameter scale:                ripple view scale fuctor
     - parameter startRect:            The initial frame rectangle of the ripple view to be animated
     - parameter scaleAnimateDuration: The duration of the ripple view scale.
     - parameter fadeAnimateDuration:  The duration of the ripple view fade out.
     - parameter completionHandler:    A closure to be executed when the animation sequence ends
     */
    public func rippleAnimate(color color: UIColor, scale: CGFloat, startRect: CGRect, scaleAnimateDuration: NSTimeInterval, fadeAnimateDuration: NSTimeInterval, completionHandler: (() -> Void)?) {
        
        let rippleView = RippleView(frame: startRect, backgroundColor: color)
        self.addSubview(rippleView)
        
        let scaleAnimation = { () -> Void in
            let widthRatio = self.frame.width / rippleView.frame.width
            rippleView.transform = CGAffineTransformMakeScale(widthRatio * scale, widthRatio * scale)
        }
        
        let fadeAnimation = { rippleView.alpha = 0.0 }
        
        // start scale animation
        UIView.animateWithDuration(scaleAnimateDuration, animations: scaleAnimation) { (completion) -> Void in
            if completion {
                
                // start fade animation
                UIView.animateWithDuration(fadeAnimateDuration, animations: fadeAnimation) { (completion) -> Void in
                    if completion {
                        rippleView.removeFromSuperview()
                        
                        if let completionHandler = completionHandler {
                            completionHandler()
                        }
                        
                    }
                }
            }
        }
    }

}

/// Custom UIView for ripple effects
private final class RippleView: UIView {

    init(frame: CGRect, backgroundColor: UIColor) {
        super.init(frame: frame)
        self.backgroundColor = backgroundColor
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func drawRect(rect: CGRect) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: CGRectGetWidth(self.bounds) / 2)
        let maskLayer = CAShapeLayer()
        maskLayer.path = maskPath.CGPath
        self.layer.mask = maskLayer;
    }
    
}