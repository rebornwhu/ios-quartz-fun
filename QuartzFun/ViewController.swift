//
//  ViewController.swift
//  QuartzFun
//
//  Created by Xiao Lu on 1/8/16.
//  Copyright © 2016 Xiao Lu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorControl: UISegmentedControl!
    
    @IBAction func changeColor(sender: UISegmentedControl) {
        let drawingColorSelection = DrawingColor(rawValue: UInt(sender.selectedSegmentIndex))
        
        func setCurrentColor(color: UIColor, view: QuartzFunView) {
            view.currentColor = color
            view.useRandomColor = false
        }
        
        if let drawingColor = drawingColorSelection {
            let funView = view as! QuartzFunView
            var color: UIColor?
            switch drawingColor {
            case .Red:
                color = UIColor.redColor()
            case .Blue:
                color = UIColor.blueColor()
            case .Yellow:
                color = UIColor.yellowColor()
            case .Green:
                color = UIColor.grayColor()
            case  .Random:
                color = UIColor.randomColor()
            }
            
            setCurrentColor(color!, view: funView)
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

