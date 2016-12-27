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
    //All images should have the same size.
    public var backgroundImagesNames = [String]()

    public func configureScrollingBackground() {
        for i in 0...backgroundImagesNames.count - 1 {
            let node = SKSpriteNode(imageNamed: backgroundImagesNames[i])

            let multiplier = node.size.width / node.size.height
            node.size = CGSize(width: size.height * multiplier, height: size.height)

            node.anchorPoint = CGPoint(x: 0, y: node.anchorPoint.y)
            node.position = CGPoint(x: -self.size.width/2 + CGFloat(i) * node.size.width, y: node.position.y)
            addChild(node)
        }
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
