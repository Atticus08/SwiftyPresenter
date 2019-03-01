//
//  SwiftyPresenter+publicfunctions.swift
//  SwiftyPresenter
//
//  Created by Tom Fritz on 3/1/19.
//  Copyright © 2019 Tom Fritz. All rights reserved.
//

import UIKit


public extension SwiftyPresenter {
    
    
    // MARK: - View Presentation Transition Function Calls
    
    func transition(from direction: SwiftyDirection, useDimmer: Bool, withContainerSizeof containerSize: SwiftyDimensions = .containerSize(width: 1, height: 1), framePositionAt framePos: SwiftyDimensions = .framePos(width: 1/3, height: 1/3)) {
        self.options.direction = direction
        self.options.useDimmer = useDimmer
        self.options.containerSize = containerSize
        self.options.framePos = framePos
    }
    
    func transition(withAnimationDurationOf duration:TimeInterval, usingSpringWithDamping: CGFloat = 1, atInitialSpeedOf initialSpringVelocity: CGFloat = 1, withADelayOf delay: TimeInterval = 0) {
        self.options.duration = duration
        self.options.usingSpringWithDamping = usingSpringWithDamping
        self.options.initialSpringVelocity = initialSpringVelocity
        self.options.delay = delay
    }
    
    func transition(withRoundCornersOn roundCorners: UIRectCorner, cornerRadius: CGFloat = 10) {
        self.options.roundCorners = roundCorners
        self.options.cornerRadius = cornerRadius
    }
}
