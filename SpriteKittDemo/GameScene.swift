//
//  GameScene.swift
//  SpriteKittDemo
//
//  Created by MariaSaveleva on 21/12/2016.
//  Copyright © 2016 MariaSaveleva. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    //allow double jump
    private let kJumps = 2
    private let kCityScrollingVelocity: CGFloat = 20.0 / 4
    private let kMountainsVelocity: CGFloat = 5.0 / 4
    private let kCloudsVelocity: CGFloat = 2.0 / 4

    private var skyGradient: SKSpriteNode?
    private var player: Player?
    private var ice: SKSpriteNode?
    private var scrollingCityBackground: ScrollingBackground?
    private var scrollingMountainsBackground: ScrollingBackground?
    private var scrollingCloudsBackground: ScrollingBackground?

    private var platformsGenerator: PlatformsGenerator?
    private var platformsNode: SKSpriteNode?

    private var jumps = 0
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        skyGradient = childNode(withName: "skyGradient") as? SKSpriteNode

        scrollingCloudsBackground = childNode(withName: "scrollingCloudsBackground") as? ScrollingBackground
        if let _ = self.scrollingCloudsBackground {
            configureCloudsBackground()
        }

        scrollingMountainsBackground = childNode(withName: "scrollingMountainsBackground") as? ScrollingBackground
        if let _ = self.scrollingMountainsBackground {
            configureMountainsBackground()
        }

        scrollingCityBackground = childNode(withName: "scrollingCityBackground") as? ScrollingBackground
        if let _ = self.scrollingCityBackground {
            configureCityBackground()
        }

        player = childNode(withName: "player") as? Player
        if let player = self.player {
            player.physicsBody?.categoryBitMask = kPlayerCategory
            player.physicsBody?.contactTestBitMask = kIceCategory
            player.run()
        }

        ice = childNode(withName: "ice") as? SKSpriteNode
        if let ice = self.ice {
            ice.physicsBody?.categoryBitMask = kIceCategory
            ice.physicsBody?.contactTestBitMask = kPlayerCategory
        }

        platformsGenerator = PlatformsGenerator()
        platformsNode = platformsGenerator?.configurePlatformsNode(size: self.size)

        if let platformsNode = self.platformsNode {
            addChild(platformsNode)
            platformsNode.position = self.position
            platformsNode.zPosition = 2
        }
    }

    override func update(_ currentTime: TimeInterval) {
        scrollingCityBackground?.update(currentTime: currentTime)
        scrollingMountainsBackground?.update(currentTime: currentTime)
        scrollingCloudsBackground?.update(currentTime: currentTime)

        platformsGenerator?.updatePlatform(velocity: kCityScrollingVelocity)
    }

    //MARK: - Private methods
    private func configureCityBackground() {
        scrollingCityBackground?.velocity = kCityScrollingVelocity
        scrollingCityBackground?.backgroundImagesNames = ["city01", "city02", "city03", "city04", "city05", "city06", "city07", "city08"]
        scrollingCityBackground?.configureScrollingBackground()
    }

    private func configureMountainsBackground() {
        scrollingMountainsBackground?.velocity = kMountainsVelocity
        scrollingMountainsBackground?.backgroundImagesNames = ["mountains01", "mountains02", "mountains03", "mountains04", "mountains05", "mountains06", "mountains07", "mountains08"]
        scrollingMountainsBackground?.configureScrollingBackground()
    }

    private func configureCloudsBackground() {
        scrollingCloudsBackground?.velocity = kCloudsVelocity
        scrollingCloudsBackground?.backgroundImagesNames = ["clouds01", "clouds02", "clouds03", "clouds04", "clouds05", "clouds06", "clouds07", "clouds08"]
        scrollingCloudsBackground?.configureScrollingBackground()
    }

    //MARK: - SKPhysicsContactDelegate methods

    func didBegin(_ contact: SKPhysicsContact) {
        player?.inAir = false
        player?.run()
        jumps = 0

        //coins
        if contact.bodyB.node is Coin {
            if let coin = contact.bodyB.node as? Coin {
                coin.collected()
            }
        }
    }

    //MARK: - Touch methods

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if jumps < kJumps {
            player?.jump()
            jumps += 1
            player?.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 200.0)) //impulse vs force?
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }

}
