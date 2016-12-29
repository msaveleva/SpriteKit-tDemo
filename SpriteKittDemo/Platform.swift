//
//  Platform.swift
//  SpriteKittDemo
//
//  Created by MariaSaveleva on 27/12/2016.
//  Copyright © 2016 MariaSaveleva. All rights reserved.
//

import Foundation
import SpriteKit

class Platform: SKSpriteNode {

    private let kPlayerCategory: UInt32 = 1
    private let kIceCategory: UInt32 = 2

    public func configure() {
        let squareValue = 1076 - 160
        centerRect = CGRect(x: 80/1076, y: 80/1076, width: squareValue/1076, height: squareValue/1076)

        physicsBody = SKPhysicsBody(rectangleOf: frame.size)
        physicsBody?.isDynamic = false
        physicsBody?.categoryBitMask = kIceCategory
        physicsBody?.collisionBitMask = 0
        physicsBody?.contactTestBitMask = kPlayerCategory
    }
    
}
