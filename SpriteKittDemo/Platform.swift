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
        centerRect = CGRect(x: 60.0/180.0, y: 60.0/180.0, width: 4.0/180.0, height: 4.0/180.0)

        physicsBody = SKPhysicsBody(rectangleOf: frame.size)
        physicsBody?.isDynamic = false
        physicsBody?.categoryBitMask = kIceCategory
        physicsBody?.collisionBitMask = 0
        physicsBody?.contactTestBitMask = kPlayerCategory
    }
    
}
