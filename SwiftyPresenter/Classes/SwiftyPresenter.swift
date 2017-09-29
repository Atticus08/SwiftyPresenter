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

import UIKit

public enum PresentationDirection {
    case left
    case top
    case right
    case bottom
}

public enum SwiftyDimensions {
    case containerSize(width: CGFloat, height: CGFloat)
    case framePos(width: CGFloat, height: CGFloat)
}

internal struct SwiftyOptions {
    var useDimmer: Bool = true
    var dismissWithDimmer: Bool = true
    var direction: PresentationDirection = .bottom
    var containerSize: SwiftyDimensions = .containerSize(width: 1,height: 1)
    var framePos: SwiftyDimensions = .framePos(width: 1/3, height: 1/3)
    var duration: TimeInterval = 0.5
    var delay: TimeInterval = 0.0
    var usingSpringWithDamping: CGFloat = 1.0
    var initialSpringVelocity: CGFloat = 1.0
    var roundCorners: UIRectCorner? = nil
    var cornerRadius: CGFloat = 10
}

public final class SwiftyPresenter: NSObject {
    internal var options: SwiftyOptions
    
    public override init() {
        self.options = SwiftyOptions()
    }
}
