//
//  SwiftyPresenterAnimator+animatedTransition.swift
//  SwiftyPresenter
//
//  Created by Tom Fritz on 3/1/19.
//  Copyright © 2019 Tom Fritz. All rights reserved.
//

import UIKit

extension SwiftyPresenterAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration // Seconds to perform transition
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
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
