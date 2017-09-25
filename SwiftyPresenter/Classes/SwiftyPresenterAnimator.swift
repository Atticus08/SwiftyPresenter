/**
 SwiftyPresenterAnimator.swift
 SwiftyPresenter
 
 Created by Atticus08 on 9/21/17.
 Copyright © 2017 Atticus08. All rights reserved.
 
 The MIT License (MIT)
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

import UIKit

internal final class SwiftyPresenterAnimator: NSObject {
    fileprivate let direction: PresentationDirection
    fileprivate let isPresentation: Bool
    fileprivate let duration: TimeInterval
    fileprivate let delay: TimeInterval
    fileprivate let usingSpringWithDamping: CGFloat
    fileprivate let initialSpringVelocity: CGFloat
    
    init(isPresentation: Bool, options: SwiftyOptions) {
        self.isPresentation = isPresentation
        self.direction = options.direction
        self.duration = options.duration
        self.delay = options.delay
        self.usingSpringWithDamping = options.usingSpringWithDamping
        self.initialSpringVelocity = options.initialSpringVelocity
    }
}

extension SwiftyPresenterAnimator: UIViewControllerAnimatedTransitioning {
    internal func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration // Seconds to perform transition
    }
    
    internal func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        /**
         Determine which controller we'll be "moving to" (if we're presenting), or moving from when
         we're dismissing the view.
         */
        let key = isPresentation ? UITransitionContextViewControllerKey.to : UITransitionContextViewControllerKey.from
        let controller = transitionContext.viewController(forKey: key)!
        
        // Add View Controller's view to view heirarchy.
        if isPresentation {
            transitionContext.containerView.addSubview(controller.view)
        }
        
        // Set up origin of for the view controller's frame
        let presentedFrame = transitionContext.finalFrame(for: controller)
        var dismissedFrame = presentedFrame
        switch direction {
        case .left:
            dismissedFrame.origin.x = -presentedFrame.width
        case .right:
            dismissedFrame.origin.x = transitionContext.containerView.frame.size.width
        case .top:
            dismissedFrame.origin.y = -presentedFrame.height
        case .bottom:
            dismissedFrame.origin.y = transitionContext.containerView.frame.size.height
        }
        
        // Set up the initial and final frames for the view controller
        let initialFrame = isPresentation ? dismissedFrame : presentedFrame
        let finalFrame = isPresentation ? presentedFrame : dismissedFrame
        // Animate the view controllers transition
        controller.view.frame = initialFrame
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: self.delay, usingSpringWithDamping: self.usingSpringWithDamping, initialSpringVelocity: self.initialSpringVelocity, options: .curveEaseIn, animations: {
            controller.view.frame = finalFrame
        }) { (fin) in
            transitionContext.completeTransition(fin)
        }
    }
}
