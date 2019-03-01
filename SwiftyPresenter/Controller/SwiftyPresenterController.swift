/**
 SwiftyPresenterController.swift
 SwiftyPresenter
 
 Created by Tom Fritz on 9/21/17.
 Copyright © 2017 Tom Fritz. All rights reserved.

 */

import UIKit

final class SwiftyPresenterController: UIPresentationController {
    fileprivate let useDimmer: Bool
    fileprivate let direction: SwiftyDirection
    fileprivate var containerSizeWidth: CGFloat = 1
    fileprivate var containerSizeHeight: CGFloat = 1
    fileprivate var framePosWidth: CGFloat = 1/3
    fileprivate var framePosHeight: CGFloat = 1/3
    fileprivate var roundCorners: UIRectCorner?
    fileprivate let cornerRadius: CGFloat
    fileprivate var dimmingView: UIView = UIView()
    
    init (presentedViewController: UIViewController, presenting presentingViewController: UIViewController?, options: SwiftyOptions) {
        self.useDimmer = options.useDimmer
        self.direction = options.direction
        if case let SwiftyDimensions.containerSize(width, height) = options.containerSize {
            self.containerSizeWidth = width
            self.containerSizeHeight = height
        }
        if case let SwiftyDimensions.framePos(width, height) = options.framePos {
            self.framePosWidth = width
            self.framePosHeight = height
        }
        if let roundCorners = options.roundCorners {
            self.roundCorners = roundCorners
        }
        self.cornerRadius = options.cornerRadius
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        setupDimmingView()
    }
    
    // Set up the dimming view when Presentation Controller is presented
    override func presentationTransitionWillBegin() {
        containerView?.insertSubview(dimmingView, at: 0)
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[dimmingView]|", options: [],
                                                                   metrics: nil, views: ["dimmingView": dimmingView]))
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[dimmingView]|", options: [],
                                                                   metrics: nil, views: ["dimmingView": dimmingView]))
        
        guard let coordinator = presentedViewController.transitionCoordinator else {
            self.dimmingView.alpha = 1.0
            return
        }
        coordinator.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 1.0
        })
    }
    
    // Perform actions when controller container is dismissed
    override func dismissalTransitionWillBegin() {
        guard let coordinator = presentedViewController.transitionCoordinator else {
            self.dimmingView.alpha = 0.0
            return
        }
        
        coordinator.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 0.0
        })
    }
    
    // Reset the presented views frame to fit any changes to the container view frame
    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = frameOfPresentedViewInContainerView
        if let corners = self.roundCorners {
            presentedView?.roundCorners(corners: corners, radius: self.cornerRadius)
        }        
    }
    
    // Return the full frame of the presented view
    override var frameOfPresentedViewInContainerView: CGRect {
        var frame: CGRect = .zero
        frame.size = size(forChildContentContainer: presentedViewController, withParentContainerSize: containerView!.bounds.size)

        switch direction {
        case .right:
            frame.origin.x = containerView!.frame.width * (1 - self.framePosWidth)
        case .bottom:
            frame.origin.y = containerView!.frame.height * (1 - self.framePosHeight)
        default:
            frame.origin = .zero
        }
        return frame
    }
    
    // Calculated the size of the presented view controller
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        switch direction {
        case .left, .right:
            return CGSize(width: parentSize.width*(2.0/3.0), height: parentSize.height)
        case .bottom, .top:
            return CGSize(width: parentSize.width * self.containerSizeWidth, height: parentSize.height * self.containerSizeHeight)
        }
    }
}

// MARK: - Setup Methods Extension

private extension SwiftyPresenterController {
    
    func setupDimmingView () {
        self.dimmingView.translatesAutoresizingMaskIntoConstraints = false
        if self.useDimmer {
            self.dimmingView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        } else {
            self.dimmingView.backgroundColor = UIColor(white: 1.0, alpha: 0.0)
        }
        self.dimmingView.isUserInteractionEnabled = true
        self.dimmingView.alpha = 0
        self.dimmingView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:))))
    }
    
    @objc dynamic func handleTap(recognizer: UITapGestureRecognizer) {
        presentingViewController.dismiss(animated: true)
    }
}
