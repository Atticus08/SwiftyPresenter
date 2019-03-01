//
//  Models.swift
//  SwiftyPresenter
//
//  Created by Tom Fritz on 3/1/19.
//  Copyright © 2019 Tom Fritz. All rights reserved.
//

public enum SwiftyDirection {
    case left
    case top
    case right
    case bottom
}

public enum SwiftyDimensions {
    case containerSize(width: CGFloat, height: CGFloat)
    case framePos(width: CGFloat, height: CGFloat)
}

struct SwiftyOptions {
    var useDimmer: Bool = true
    var direction: SwiftyDirection = .bottom
    var containerSize: SwiftyDimensions = .containerSize(width: 1,height: 1)
    var framePos: SwiftyDimensions = .framePos(width: 1/3, height: 1/3)
    var duration: TimeInterval = 0.5
    var delay: TimeInterval = 0.0
    var usingSpringWithDamping: CGFloat = 1.0
    var initialSpringVelocity: CGFloat = 1.0
    var roundCorners: UIRectCorner? = nil
    var cornerRadius: CGFloat = 10
}
