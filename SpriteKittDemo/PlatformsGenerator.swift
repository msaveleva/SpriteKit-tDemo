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

    private let randomDistribPlatformWidth = GKRandomDistribution(lowestValue: 30, highestValue: 100)
    private let randomDistribPlatformPosition = GKRandomDistribution(lowestValue: 30, highestValue: 100)

    private func generatePlatformsFor(node: SKNode) {
        //generate platforms and place them on node
        if node.children.count < kMaxPlatformsOnScreen {

            guard let platform = createPlatform() else { return }

            node.addChild(platform)
        }
    }

    private func createPlatform() -> Platform? {
        let randomRect = calculateRandomPlatformRect()
        let platform = Platform(rect: randomRect, cornerRadius: kCornerRadius) //maybe it already has 0;0 origin

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
