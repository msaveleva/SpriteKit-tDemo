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
    private let kCoinWidthHeight: CGFloat = 120

    public func configure() {
        physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: kCoinWidthHeight / 2,
                                                        height: kCoinWidthHeight / 2))
        physicsBody?.isDynamic = false
        physicsBody?.categoryBitMask = kIceCategory
        physicsBody?.collisionBitMask = 0
        physicsBody?.contactTestBitMask = kPlayerCategory
    }

    public func collected() {
        removeFromParent()
    }

}
