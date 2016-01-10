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
    
    private class func randomDouble() -> Double { // need to use class func
        return Double(arc4random() % 256) / 255
    }
}

enum Shape : UInt {
    case Line = 0, Rect, Ellipse, Image
}

enum DrawingColor : UInt {
    case Red = 0, Blue, Yellow, Green, Random
}

class QuartzFunView: UIView {
    
    var shape = Shape.Line
    var currentColor = UIColor.redColor()

    var useRandomColor = false
    
    private let image = UIImage(named: "iphone")!
    private var firstTouchLocation: CGPoint = CGPointZero
    private var lastTouchLocation: CGPoint = CGPointZero

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if useRandomColor {
            currentColor = UIColor.randomColor()
        }
        
        let touch = touches.first
        firstTouchLocation = (touch?.locationInView(self))!
        setNeedsDisplay()
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        displayTouchMovement(touches, withEvent: event)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        displayTouchMovement(touches, withEvent: event)
    }
    
    func displayTouchMovement(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        lastTouchLocation = (touch?.locationInView(self))!
        setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 2.0)
        CGContextSetStrokeColorWithColor(context, currentColor.CGColor)
        
        CGContextSetFillColorWithColor(context, currentColor.CGColor)
        let currentRect = CGRectMake(firstTouchLocation.x, firstTouchLocation.y, lastTouchLocation.x - firstTouchLocation.x, lastTouchLocation.y - firstTouchLocation.y)
        
        switch shape {
        case .Line:
            CGContextMoveToPoint(context, firstTouchLocation.x, firstTouchLocation.y)
            CGContextAddLineToPoint(context, lastTouchLocation.x, lastTouchLocation.y)
            CGContextStrokePath(context)
        case .Rect:
            CGContextAddRect(context, currentRect)
            CGContextDrawPath(context, CGPathDrawingMode.FillStroke)
        case .Ellipse:
            CGContextAddEllipseInRect(context, currentRect)
            CGContextDrawPath(context, CGPathDrawingMode.FillStroke)
        case .Image:
            break
        }
    }
    
}
