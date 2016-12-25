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
    private let kCityScrollingVelocity: CGFloat = 5.0

    private let kPlayerCategory: UInt32 = 1
    private let kIceCategory: UInt32 = 2

    private var skyGradient: SKSpriteNode?
    private var player: Player?
    private var ice: SKSpriteNode?
    private var scrollingCityBackground: ScrollingBackground?

    private var jumps = 0
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        skyGradient = childNode(withName: "skyGradient") as? SKSpriteNode

        player = childNode(withName: "player") as? Player
        if let player = self.player {
            player.physicsBody?.categoryBitMask = kPlayerCategory
            player.physicsBody?.contactTestBitMask = kIceCategory
        }

        ice = childNode(withName: "ice") as? SKSpriteNode
        if let ice = self.ice {
            ice.physicsBody?.categoryBitMask = kIceCategory
            ice.physicsBody?.contactTestBitMask = kPlayerCategory
        }

        scrollingCityBackground = childNode(withName: "scrollingCityBackground") as? ScrollingBackground
        if let _ = self.scrollingCityBackground {
            configureBackground()
        }
    }

    private func configureBackground() {
        scrollingCityBackground?.velocity = kCityScrollingVelocity
        scrollingCityBackground?.backgroundImageName = "testImage"
        scrollingCityBackground?.configureScrollingBackground()
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        scrollingCityBackground?.update(currentTime: currentTime)
    }

    //MARK: - Private methods


    //MARK: - SKPhysicsContactDelegate methods

    func didBegin(_ contact: SKPhysicsContact) {
        player?.inAir = false
        jumps = 0
    }

    //MARK: - Touch methods

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if jumps < kJumps {
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
