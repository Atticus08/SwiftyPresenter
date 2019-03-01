/**
 SwiftyPresenterAnimator.swift
 SwiftyPresenter

 Created by Tom Fritz on 9/21/17.
 Copyright © 2017 Tom Fritz. All rights reserved.
 */

import UIKit

final class SwiftyPresenterAnimator: NSObject {
    let direction: SwiftyDirection
    let isPresentation: Bool
    let duration: TimeInterval
    let delay: TimeInterval
    let usingSpringWithDamping: CGFloat
    let initialSpringVelocity: CGFloat
    
    init(isPresentation: Bool, options: SwiftyOptions) {
        self.isPresentation = isPresentation
        self.direction = options.direction
        self.duration = options.duration
        self.delay = options.delay
        self.usingSpringWithDamping = options.usingSpringWithDamping
        self.initialSpringVelocity = options.initialSpringVelocity
    }
}
