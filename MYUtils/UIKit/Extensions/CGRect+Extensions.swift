//
//  CGRect+Extensions.swift
//  InstaCollage
//
//  Created by Optimus Prime on 20.03.17.
//  Copyright © 2017 Tren Lab. All rights reserved.
//

import CoreGraphics

// MARK: - Operators

// MARK: - Minus

public func -(lhs: CGRect, rhs: CGRect) -> CGRect {
    return rectCalculation(lhs, rhs, -)
}

public func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return pointCalculation(lhs, rhs, -)
}

public func -(lhs: CGSize, rhs: CGSize) -> CGSize {
    return sizeCalculation(lhs, rhs, -)
}

// MARK: - Plus

public func +(lhs: CGRect, rhs: CGRect) -> CGRect {
    return rectCalculation(lhs, rhs, +)
}

public func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return pointCalculation(lhs, rhs, +)
}

public func +(lhs: CGSize, rhs: CGSize) -> CGSize {
    return sizeCalculation(lhs, rhs, +)
}

// MARK: - Multiplication

public func *(lhs: CGRect, rhs: CGRect) -> CGRect {
    return rectCalculation(lhs, rhs, *)
}

public func *(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return pointCalculation(lhs, rhs, *)
}

public func *(lhs: CGSize, rhs: CGSize) -> CGSize {
    return sizeCalculation(lhs, rhs, *)
}

// MARK: - Division

public func /(lhs: CGRect, rhs: CGRect) -> CGRect {
    return rectCalculation(lhs, rhs, /)
}

public func /(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return pointCalculation(lhs, rhs, /)
}

public func /(lhs: CGSize, rhs: CGSize) -> CGSize {
    return sizeCalculation(lhs, rhs, /)
}

// MARK: - Calculations

fileprivate func rectCalculation(_ lhs: CGRect,_ rhs: CGRect,_ fun: (CGFloat, CGFloat) -> CGFloat) -> CGRect {
    return CGRect(origin: pointCalculation(lhs.origin, rhs.origin, fun), size: sizeCalculation(lhs.size, rhs.size, fun))
}

fileprivate func pointCalculation(_ lhs: CGPoint,_ rhs: CGPoint,_ fun: (CGFloat, CGFloat) -> CGFloat) -> CGPoint {
    return CGPoint(x: fun(lhs.x, rhs.x), y: fun(lhs.y, rhs.y))
}

fileprivate func sizeCalculation(_ lhs: CGSize,_ rhs: CGSize, _ fun: (CGFloat, CGFloat) -> CGFloat) -> CGSize {
    return CGSize(width: fun(lhs.width, rhs.width), height: fun(lhs.height, rhs.height))
}
