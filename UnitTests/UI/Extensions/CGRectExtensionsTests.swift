//
//  CGRectExtensionsTests.swift
//  MYUtils
//
//  Created by Damon Cricket on 02.06.17.
//  Copyright © 2017 Trenlab. All rights reserved.
//

import XCTest
@testable import MYUtils

fileprivate enum CGOperator {
    
    case plus
    
    case minus
    
    case multiplying
    
    case division

    
    func closure() -> (CGFloat, CGFloat) -> CGFloat {
        switch self {
        case .plus:
            return (+)
        case .minus:
            return (-)
        case .multiplying:
            return (*)
        case .division:
            return (/)
        }
    }
    
    static let operators: [CGOperator] = [.plus, .minus, .multiplying, .division]
}

class CGRectExtensionsTests: XCTestCase {
    
    // MARK: - CGRect
    
    func testCGRectOperators() {
        for mock in getRectOperatorsData() {
            let result: CGRect
            switch mock.oprt {
            case .plus:
                result = mock.lhs + mock.rhs
            case .minus:
                result = mock.lhs - mock.rhs
            case .multiplying:
                result = mock.lhs * mock.rhs
            case .division:
                result = mock.lhs / mock.rhs
            }
            XCTAssertEqual(result, mock.result)
        }

        for mock in getPointOperatorsData() {
            let result: CGPoint
            switch mock.oprt {
            case .plus:
                result = mock.lhs + mock.rhs
            case .minus:
                result = mock.lhs - mock.rhs
            case .multiplying:
                result = mock.lhs * mock.rhs
            case .division:
                result = mock.lhs / mock.rhs
            }
            XCTAssertEqual(result, mock.result)
        }
        
        for mock in getSizeOperatorsData() {
            let result: CGSize
            switch mock.oprt {
            case .plus:
                result = mock.lhs + mock.rhs
            case .minus:
                result = mock.lhs - mock.rhs
            case .multiplying:
                result = mock.lhs * mock.rhs
            case .division:
                result = mock.lhs / mock.rhs
            }
            XCTAssertEqual(result, mock.result)
        }
    }

    // MARK: - Operators Data
    
    fileprivate func getRectOperatorsData() -> [(lhs: CGRect, rhs: CGRect, oprt: CGOperator, result: CGRect)] {
        var data: [(lhs: CGRect, rhs: CGRect, oprt: CGOperator, result: CGRect)] = []
        
        for oprt in CGOperator.operators {
            let lhsRect = CGRect(x: randomSignedCFloat(), y: randomSignedCFloat(), width: randomCFloat(), height: randomCFloat())
            let rhsRect = CGRect(x: randomSignedCFloat(), y: randomSignedCFloat(), width: randomCFloat(), height: randomCFloat())
            
            let clsr: (CGFloat, CGFloat) -> CGFloat = oprt.closure()
            
            let resultRect = CGRect(x: clsr(lhsRect.minX, rhsRect.minX), y: clsr(lhsRect.minY, rhsRect.minY), width: clsr(lhsRect.width, rhsRect.width), height: clsr(lhsRect.height, rhsRect.height))
            
            data.append((lhs: lhsRect, rhs: rhsRect, oprt: oprt, result: resultRect))
        }

        return data
    }

    fileprivate func getPointOperatorsData() -> [(lhs: CGPoint, rhs: CGPoint, oprt: CGOperator, result: CGPoint)] {
        var data: [(lhs: CGPoint, rhs: CGPoint, oprt: CGOperator, result: CGPoint)] = []
        
        for oprt in CGOperator.operators {
            let lhsPoint = CGPoint(x: randomSignedCFloat(), y: randomSignedCFloat())
            let rhsPoint = CGPoint(x: randomSignedCFloat(), y: randomSignedCFloat())
            
            let clsr: (CGFloat, CGFloat) -> CGFloat = oprt.closure()
            
            let resultPoint = CGPoint(x: clsr(lhsPoint.x, rhsPoint.x), y: clsr(lhsPoint.y, rhsPoint.y))
            
            data.append((lhs: lhsPoint, rhs: rhsPoint, oprt: oprt, result: resultPoint))
        }
        
        return data
    }
    
    fileprivate func getSizeOperatorsData() -> [(lhs: CGSize, rhs: CGSize, oprt: CGOperator, result: CGSize)] {
        var data: [(lhs: CGSize, rhs: CGSize, oprt: CGOperator, result: CGSize)] = []
        
        for oprt in CGOperator.operators {
            let lhsSize = CGSize(width: randomCFloat(), height: randomCFloat())
            let rhsSize = CGSize(width: randomCFloat(), height: randomCFloat())
            
            let clsr: (CGFloat, CGFloat) -> CGFloat = oprt.closure()
            
            let resultSize = CGSize(width: clsr(lhsSize.width, rhsSize.width), height: clsr(lhsSize.height, rhsSize.height))
            
            data.append((lhs: lhsSize, rhs: rhsSize, oprt: oprt, result: resultSize))
        }
        
        return data
    }
    
    fileprivate func randomSignedCFloat() -> CGFloat {
        return randomCFloat() * CGFloat.randomSign
    }
    
    fileprivate func randomCFloat() -> CGFloat {
        return CGFloat.random(min: 10, max: 1000)
    }
}
