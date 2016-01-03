//
//  OriginalCell.swift
//  Demo
//
//  Created by Motoki on 2015/12/22.
//  Copyright © 2015年 MotokiNarita. All rights reserved.
//

import UIKit

// RippleAnimation example for UITableViewCell
class OriginalCell: UITableViewCell {

    var rippleColor = UIColor.midnight()

    typealias CellInfo = (color: UIColor, clipsToBouds: Bool)
    func configure(info: CellInfo) {

        selectionStyle = .None
        rippleColor = info.color

        // !!!: if you would like to use ripple effect to outside of the view, you should set `clipToBouds` prperty to `false`.
        // cell.clipsToBounds = false
        clipsToBounds = info.clipsToBouds
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // !!!: if you want to use ripple animation for UITableViewCell, you should override `setSelected` function.
        if selected {
            let rippleStartSize = CGSize(width: 10, height: 10)
            let startRect = CGRect(x: self.frame.width/2 - rippleStartSize.width/2, y: self.frame.height/2 - rippleStartSize.height/2, width: rippleStartSize.width, height: rippleStartSize.height)

            self.contentView.rippleAnimate(color: rippleColor, scale: 10, startRect: startRect, scaleAnimateDuration: 1.0, fadeAnimateDuration: 0.5) { () -> Void in
                print("ripple!!")
            }
        }
    }
}
