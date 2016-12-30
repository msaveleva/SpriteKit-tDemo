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
    private let kCoinWidthHeight: CGFloat = 55
    private let kCoinMargin: CGFloat = 100

    public func configure() {
        physicsBody = SKPhysicsBody(rectangleOf: frame.size)
        physicsBody?.isDynamic = false
        physicsBody?.categoryBitMask = kIceCategory
        physicsBody?.collisionBitMask = 0
        physicsBody?.contactTestBitMask = kPlayerCategory

        generateCoins()
    }

    private func generateCoins() {
        var coins = [Coin]()

        let numberOfCoins = Int(self.frame.width / kCoinWidthHeight)
        for _ in 0...numberOfCoins {
            let coin = Coin(imageNamed: "Coin")
            coin.anchorPoint = .zero
            coins.append(coin)

            addChild(coin)
        }

        let coinBlock = CGFloat(numberOfCoins) * kCoinWidthHeight + kCoinMargin * (CGFloat(numberOfCoins) - 1)
        let sideMargin = (frame.width - coinBlock) / 2

        for i in 0...numberOfCoins {
            let coin = coins[i]

            let margin = sideMargin + kCoinWidthHeight * CGFloat(i) + kCoinMargin * CGFloat(i)
//            coin.frame = CGRect(x: margin, y: kCoinWidthHeight - 10.0, width: kCoinWidthHeight, height: kCoinWidthHeight)
            coin.position = CGPoint(x: margin, y: kCoinWidthHeight)
        }
    }
    
}
