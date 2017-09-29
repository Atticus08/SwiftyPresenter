//
//  ViewController.swift
//  SwiftyPresenter
//
//  Created by Atticus08 on 09/25/2017.
//  Copyright (c) 2017 Atticus08. All rights reserved.
//

import UIKit
import SwiftyPresenter

class ViewController: UIViewController {
    
    lazy var swiftyTransition: SwiftyPresenter = {
        let swifty = SwiftyPresenter()
        swifty.transition(from: .bottom, useDimmer: true, dismissWithDimmer: true, withContainerSizeof: .containerSize(width: 1, height: 1), framePositionAt: .framePos(width: 1, height: 0.9))
        swifty.transition(withAnimationDurationOf: 0.8)
        swifty.transition(withRoundCornersOn: [.topLeft, .topRight])
        return swifty
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

