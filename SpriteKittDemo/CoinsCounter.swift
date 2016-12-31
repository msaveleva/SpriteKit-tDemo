//
//  CoinsCounter.swift
//  SpriteKittDemo
//
//  Created by MariaSaveleva on 31/12/2016.
//  Copyright © 2016 MariaSaveleva. All rights reserved.
//

import Foundation
import SpriteKit

class CoinsCounter: SKSpriteNode {

    private let kUIHeightMargin: CGFloat = 50.0

    private var label: SKLabelNode?
    private var numberOfCoins = 0

    public func configure() {
        position = CGPoint(x: position.x,
                           y: UIScreen.main.bounds.width / 2 - kUIHeightMargin)
        configureLabel()
    }

    public func increaseCounter() {
        numberOfCoins += 1
        label?.text = "\(numberOfCoins)"
    }

    private func configureLabel() {
        label = childNode(withName: "coinsLabel") as? SKLabelNode

        if let label = self.label {
            label.fontColor = UIColor.coinsTextColor()
            label.text = "\(numberOfCoins)"
        }
    }

}
