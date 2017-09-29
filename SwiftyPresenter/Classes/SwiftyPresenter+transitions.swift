/**
 SwiftyPresenter.swift
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

extension SwiftyPresenter: UIViewControllerTransitioningDelegate {
    public func transition(from direction: PresentationDirection, useDimmer: Bool, dismissWithDimmer: Bool,  withContainerSizeof containerSize: SwiftyDimensions = .containerSize(width: 1, height: 1), framePositionAt framePos: SwiftyDimensions = .framePos(width: 1/3, height: 1/3)) {
        self.options.direction = direction
        self.options.useDimmer = useDimmer
        self.options.dismissWithDimmer = dismissWithDimmer
        self.options.containerSize = containerSize
        self.options.framePos = framePos
    }
    
    public func transition(withAnimationDurationOf duration:TimeInterval, usingSpringWithDamping: CGFloat = 1, atInitialSpeedOf initialSpringVelocity: CGFloat = 1, withADelayOf delay: TimeInterval = 0) {
        self.options.duration = duration
        self.options.usingSpringWithDamping = usingSpringWithDamping
        self.options.initialSpringVelocity = initialSpringVelocity
        self.options.delay = delay
    }
    
    public func transition(withRoundCornersOn roundCorners: UIRectCorner, cornerRadius: CGFloat = 10) {
        self.options.roundCorners = roundCorners
        self.options.cornerRadius = cornerRadius
    }
    
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return SwiftyPresenterController(presentedViewController: presented, presenting: presenting, options: self.options)
    }
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SwiftyPresenterAnimator(isPresentation: true, options: self.options)
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SwiftyPresenterAnimator(isPresentation: false, options: self.options)
    }
}
