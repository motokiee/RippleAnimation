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

    var configuration = UIView.RippleConfiguration(color: UIColor.midnight())

    typealias CellInfo = (color: UIColor, clipsToBouds: Bool)

    func configure(info: CellInfo) {

        configuration = UIView.RippleConfiguration(color: info.color)
        configuration.clipsToBounds = info.clipsToBouds

        clipsToBounds = configuration.clipsToBounds
        selectionStyle = .None
    }

    override func setSelected(selected: Bool, animated: Bool) {

        super.setSelected(selected, animated: animated)

        // !!!: if you want to use ripple animation for UITableViewCell, you should override `setSelected` function.
        if selected {

            let rippleStartSize = CGSize(width: 10, height: 10)
            let startRect = CGRect(x: self.frame.width/2 - rippleStartSize.width/2, y: self.frame.height/2 - rippleStartSize.height/2, width: rippleStartSize.width, height: rippleStartSize.height)
            configuration.startRect = startRect

            contentView.rippleAnimate(configuration, completionHandler: { print("ripple!!") })
        }
    }
}
