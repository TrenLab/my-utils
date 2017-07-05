//
//  CGRect+Extensions.swift
//  InstaCollage
//
//  Created by Optimus Prime on 20.03.17.
//  Copyright © 2017 Tren Lab. All rights reserved.
//

import CoreGraphics

// MARK: - Operators

    // MARK: - CGRect

public func +(lhs: CGRect, rhs: CGRect) -> CGRect {
    return rectCalculation(lhs, rhs, +)
}

public func -(lhs: CGRect, rhs: CGRect) -> CGRect {
    return rectCalculation(lhs, rhs, -)
}

public func *(lhs: CGRect, rhs: CGRect) -> CGRect {
    return rectCalculation(lhs, rhs, *)
}

public func /(lhs: CGRect, rhs: CGRect) -> CGRect {
    return rectCalculation(lhs, rhs, /)
}

    // MARK: - CGPoint

public func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return pointCalculation(lhs, rhs, +)
}

public func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return pointCalculation(lhs, rhs, -)
}

public func *(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return pointCalculation(lhs, rhs, *)
}

public func /(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return pointCalculation(lhs, rhs, /)
}

    // MARK: - CGSize

public func +(lhs: CGSize, rhs: CGSize) -> CGSize {
    return sizeCalculation(lhs, rhs, +)
}

public func -(lhs: CGSize, rhs: CGSize) -> CGSize {
    return sizeCalculation(lhs, rhs, -)
}

public func *(lhs: CGSize, rhs: CGSize) -> CGSize {
    return sizeCalculation(lhs, rhs, *)
}

public func /(lhs: CGSize, rhs: CGSize) -> CGSize {
    return sizeCalculation(lhs, rhs, /)
}

    // MARK: - Calculations

fileprivate typealias MYCGOperatorClosure = (CGFloat, CGFloat) -> CGFloat

fileprivate func rectCalculation(_ lhs: CGRect, _ rhs: CGRect, _ funct: MYCGOperatorClosure) -> CGRect {
    return CGRect(origin: pointCalculation(lhs.origin, rhs.origin, funct), size: sizeCalculation(lhs.size, rhs.size, funct))
}

fileprivate func pointCalculation(_ lhs: CGPoint,_ rhs: CGPoint,_ funct: MYCGOperatorClosure) -> CGPoint {
    return CGPoint(x: funct(lhs.x, rhs.x), y: funct(lhs.y, rhs.y))
}

fileprivate func sizeCalculation(_ lhs: CGSize,_ rhs: CGSize, _ funct: MYCGOperatorClosure) -> CGSize {
    return CGSize(width: funct(lhs.width, rhs.width), height: funct(lhs.height, rhs.height))
}
