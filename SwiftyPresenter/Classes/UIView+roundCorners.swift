//
//  UIView+roundCorners.swift
//  SwiftyPresenter
//
//  Created by Atticus on 9/21/17.
//  Copyright © 2017 Atticus08. All rights reserved.
//

extension UIView {
    // Round UIView Corners
    internal func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
