/**
 SwiftyPresenter+vcTransition.swift
 SwiftyPresenter
 
 Created by Tom Fritz on 9/21/17.
 Copyright © 2017 Tom Fritz. All rights reserved.
 */

extension SwiftyPresenter: UIViewControllerTransitioningDelegate {
    
    // MARK: - UI View Controller Transition Delegate Protocol Methods
    
    private func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return SwiftyPresenterController(presentedViewController: presented, presenting: presenting, options: self.options)
    }
    
    private func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SwiftyPresenterAnimator(isPresentation: true, options: self.options)
    }
    
    private func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SwiftyPresenterAnimator(isPresentation: false, options: self.options)
    }
}
