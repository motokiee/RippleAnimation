//
//  OriginalCell.swift
//  Demo
//
//  Created by Motoki on 2015/12/22.
//  Copyright © 2015年 MotokiNarita. All rights reserved.
//

import UIKit

import UIKit

// RippleAnimation example for UITableViewCell
class OriginalCell: UITableViewCell {
    
    var rippleColor = UIColor.midnight()
    
    typealias CellInfo = (UIColor, Bool)
    func configure(info: CellInfo) {
        
        selectionStyle = .None
        rippleColor = info.0
        
        // !!!: if you would like to use ripple effect to outside of the view, you should set `clipToBouds` prperty to `false`.
        // cell.clipsToBounds = false
        clipsToBounds = info.1
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // !!!: if you want to use ripple animation for UITableViewCell, you should override `setSelected` function.
        if selected {
            let rippleStartSize = CGSizeMake(10, 10)
            let startRect = CGRectMake(self.frame.width/2 - rippleStartSize.width/2, self.frame.height/2 - rippleStartSize.height/2, rippleStartSize.width, rippleStartSize.height)
            
            self.contentView.rippleAnimate(color: rippleColor, scale: 10, startRect: startRect, scaleAnimateDuration: 1.0, fadeAnimateDuration: 0.5) { () -> Void in
                print("ripple!!")
            }
        }
    }
    
}

