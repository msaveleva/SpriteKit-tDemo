//
//  PlatformsGenerator.swift
//  SpriteKittDemo
//
//  Created by MariaSaveleva on 27/12/2016.
//  Copyright © 2016 MariaSaveleva. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class PlatformsGenerator {

    private let kCornerRadius: CGFloat = 10.0
    private let kPlatformHeight: CGFloat = 60.0
    private let kMaxPlatformsOnScreen = 2

    private let randomDistribPlatformWidth = GKRandomDistribution(lowestValue: 70, highestValue: 300)
    private let randomDistribPlatformPosition = GKRandomDistribution(lowestValue: -100, highestValue: 100)

    private var platforms = [Platform]()
    private var parentNode = SKSpriteNode()

    public func configurePlatformsNode(size: CGSize) -> SKSpriteNode {
        parentNode = SKSpriteNode(color: .clear, size: size)

        return parentNode
    }

    public func updatePlatform(velocity: CGFloat) {
        generatePlatformsFor(parentNode: parentNode)

        for platform in platforms {
            let platformRightPoint = platform.position.x + platform.size.width
            let parentNodeLeftSize = parentNode.position.x - parentNode.frame.size.width/2
            if platformRightPoint < parentNodeLeftSize {
                if let index = platforms.index(of: platform) {
                    platform.removeFromParent()
                    platforms.remove(at: index)
                }
            } else {
                platform.position = CGPoint(x: platform.position.x - velocity,
                                            y: platform.position.y)
            }
        }
    }

    private func generatePlatformsFor(parentNode: SKSpriteNode) {
        //generate platforms and place them on node
        if platforms.count < kMaxPlatformsOnScreen {

            guard let platform = createPlatform() else { return }

            platforms.append(platform)
            self.parentNode = parentNode
            parentNode.addChild(platform)
        }
    }

    private func createPlatform() -> Platform? {
        let randomRect = calculateRandomPlatformRect()
        let platform = Platform(rect: randomRect, cornerRadius: kCornerRadius) //maybe it already has 0;0 origin
        platform.configure()

        return platform
    }

    private func calculateRandomPlatformRect() -> CGRect {
        let platformWidth = CGFloat(randomDistribPlatformWidth.nextInt())
        let platformPosition = CGPoint(x: randomDistribPlatformPosition.nextInt(), y: randomDistribPlatformPosition.nextInt())

        return CGRect(x: platformPosition.x,
                      y: platformPosition.y,
                      width: platformWidth,
                      height: kPlatformHeight)
    }

}
