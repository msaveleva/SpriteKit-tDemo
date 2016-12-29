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

    private let kCornerRadius: CGFloat = 30.0
    private let kPlatformHeight: CGFloat = 60.0
    private let kMaxPlatformsOnScreen = 10
    private let kMinSpace: Int = 50

    private let randomDistribPlatformWidth = GKRandomDistribution(lowestValue: 150, highestValue: 500)
    private let randomDistribPlatformPosition = GKRandomDistribution(lowestValue: -200, highestValue: 300)

    private var platforms = [Platform]()
    private var parentNode = SKSpriteNode()

    public func configurePlatformsNode(size: CGSize) -> SKSpriteNode {
        parentNode = SKSpriteNode(color: .clear, size: size)

        return parentNode
    }

    public func updatePlatform(velocity: CGFloat) {
        generatePlatformsFor(parentNode: parentNode)

        for platform in platforms {
            let platformRightPoint = platform.position.x + platform.frame.size.width
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

            platform.position = calculateRandomPlatformPosition()
            platforms.append(platform)
            parentNode.addChild(platform)
            platform.configure()
        }
    }

    private func createPlatform() -> Platform? {
        let randomRect = calculateRandomPlatformRect()
        let platform = Platform(rect: randomRect, cornerRadius: kCornerRadius) //maybe it already has 0;0 origin

        return platform
    }

    private func calculateRandomPlatformRect() -> CGRect {
        let platformWidth = CGFloat(randomDistribPlatformWidth.nextInt())

        return CGRect(x: 0,
                      y: 0,
                      width: platformWidth,
                      height: kPlatformHeight)
    }

    private func calculateRandomPlatformPosition() -> CGPoint {
        let lastPlatform = platforms.last

        if let lPlatform = lastPlatform {
            let startPoint = lPlatform.frame.origin.x + lPlatform.frame.size.width
            return CGPoint(x: randomDistribPlatformPosition.nextInt() + Int(startPoint) + kMinSpace, y: randomDistribPlatformPosition.nextInt())
        } else {
            return CGPoint(x: randomDistribPlatformPosition.nextInt(), y: randomDistribPlatformPosition.nextInt())
        }
    }

}
