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
        firstNode = SKSpriteNode(color: .green, size: size)
        secondNode = SKSpriteNode(color: .red, size: size)

        guard let firstNode = self.firstNode,
            let secondNode = self.secondNode else { return }

        firstNode.anchorPoint = CGPoint.zero
        firstNode.position = CGPoint(x: -self.size.width/2, y: -self.size.height/2)
        addChild(firstNode)

        secondNode.anchorPoint = CGPoint.zero
        secondNode.position = CGPoint(x: -self.size.width/2 + secondNode.size.width, y: -self.size.height/2)
        addChild(secondNode)
    }

    public func update(currentTime: TimeInterval) {
        guard let firstNode = self.firstNode,
            let secondNode = self.secondNode else { return }

        firstNode.position = CGPoint(x: firstNode.position.x - self.velocity, y: firstNode.position.y)
        secondNode.position = CGPoint(x: secondNode.position.x - self.velocity, y: secondNode.position.y)

        //todo: add point check for firstNode
    }

}
