//
//  Coin.swift
//  SpriteKittDemo
//
//  Created by MariaSaveleva on 30/12/2016.
//  Copyright © 2016 MariaSaveleva. All rights reserved.
//

import Foundation
import SpriteKit

class Coin: SKSpriteNode {

    private let kPlayerCategory: UInt32 = 1
    private let kIceCategory: UInt32 = 2

    public func configure() {
        physicsBody = SKPhysicsBody(rectangleOf: frame.size)
        physicsBody?.isDynamic = false
        physicsBody?.categoryBitMask = kIceCategory
        physicsBody?.collisionBitMask = 0
        physicsBody?.contactTestBitMask = kPlayerCategory
    }

}
