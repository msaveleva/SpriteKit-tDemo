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

        guard let firstNode = self.firstNode else { return }

        firstNode.anchorPoint = CGPoint.zero
        firstNode.position = self.position
        self.addChild(firstNode)
    }

    public func update(currentTime: TimeInterval) {
        //todo: apply for all child nodes
        guard let firstNode = self.firstNode else { return }

        firstNode.position = CGPoint(x: firstNode.position.x - self.velocity, y: firstNode.position.y)
    }

}
