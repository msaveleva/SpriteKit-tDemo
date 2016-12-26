//
//  ScrollingBackground.swift
//  SpriteKittDemo
//
//  Created by MariaSaveleva on 25/12/2016.
//  Copyright © 2016 MariaSaveleva. All rights reserved.
//

import Foundation
import SpriteKit

class ScrollingBackground: SKSpriteNode {

    public var velocity: CGFloat = 10.0
    public var backgroundImageName = ""

    private var firstNode: SKSpriteNode?
    private var secondNode: SKSpriteNode?

    public func configureScrollingBackground() {
        firstNode = SKSpriteNode(imageNamed: backgroundImageName)
        secondNode = SKSpriteNode(imageNamed: backgroundImageName)

        guard let firstNode = self.firstNode,
            let secondNode = self.secondNode else { return }

        firstNode.anchorPoint = CGPoint(x: 0, y: firstNode.anchorPoint.y)
        firstNode.position = CGPoint(x: -self.size.width/2, y: firstNode.position.y)
        addChild(firstNode)

        secondNode.anchorPoint = CGPoint(x: 0, y: secondNode.anchorPoint.y)
        secondNode.position = CGPoint(x: -self.size.width/2 + firstNode.size.width, y: secondNode.position.y)
        addChild(secondNode)
    }

    public func update(currentTime: TimeInterval) {
        for node in children {
            guard let sprite = node as? SKSpriteNode else { return }

            sprite.position = CGPoint(x: node.position.x - velocity, y: node.position.y)

            if sprite.position.x + sprite.size.width <= -self.size.width/2 {
                let delta = sprite.position.x + sprite.size.width
                sprite.position.x = sprite.size.width * CGFloat(children.count - 1) + delta
            }
        }
    }

}
