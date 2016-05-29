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

    private var rippleDefaultStartRect: CGRect {
        return CGRect(x:0, y:0, width:self.frame.width, height:self.frame.height)
    }

    public struct RippleConfiguration {
        var color: UIColor
        var clipsToBounds = false
        var startRect: CGRect? = nil
        var scale: CGFloat = DefaultScale
        var scaleAnimateDuration = DefaultScalingAnimateDuration
        var fadeAnimateDuration = DefaultAlphaAnimateDuration
        var completionHandler: (() -> Void)? = nil

        init(color: UIColor) {
            self.color = color
        }
    }

    public func rippleAnimate(config: UIView.RippleConfiguration, completionHandler: (() -> Void)?) {

        clipsToBounds = config.clipsToBounds
        let startRect = config.startRect ?? rippleDefaultStartRect

        self.rippleAnimate(color: config.color, scale: DefaultScale, startRect: startRect, scaleAnimateDuration: config.scaleAnimateDuration, fadeAnimateDuration: config.fadeAnimateDuration, completionHandler: completionHandler)

    }

    private func rippleAnimate(color color: UIColor, scale: CGFloat, startRect: CGRect, scaleAnimateDuration: NSTimeInterval, fadeAnimateDuration: NSTimeInterval, completionHandler: (() -> Void)?) {

        let rippleView = RippleView(frame: startRect, backgroundColor: color)
        self.addSubview(rippleView)

        let scaleAnimation = {
            let widthRatio = self.frame.width / rippleView.frame.width
            rippleView.transform = CGAffineTransformMakeScale(widthRatio * scale, widthRatio * scale)
        }

        let fadeAnimation = { rippleView.alpha = 0.0 }

        // start scale animation
        UIView.animateWithDuration(scaleAnimateDuration, animations: scaleAnimation) { completion in

            guard completion else { return }

            // start fade animation
            UIView.animateWithDuration(fadeAnimateDuration, animations: fadeAnimation) { completion in
                guard completion else { return }
                rippleView.removeFromSuperview()
                completionHandler?()
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
        self.layer.mask = maskLayer
    }

}
