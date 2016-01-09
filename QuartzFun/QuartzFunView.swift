//
//  QuartzFunView.swift
//  QuartzFun
//
//  Created by Xiao Lu on 1/8/16.
//  Copyright © 2016 Xiao Lu. All rights reserved.
//

import UIKit

extension UIColor {
    class func randomColor() -> UIColor {
        let red = CGFloat(randomDouble())
        let green = CGFloat(randomDouble())
        let blue = CGFloat(randomDouble())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    class func randomDouble() -> Double { // need to use class func
        return Double(arc4random() % 256) / 255
    }
}

class QuartzFunView: UIView {
    
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
