//
//  GameScene.swift
//  SpriteKittDemo
//
//  Created by MariaSaveleva on 21/12/2016.
//  Copyright © 2016 MariaSaveleva. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    //allow double jump
    private let kJumps = 2

    private let kPlayerCategory: UInt32 = 1
    private let kIceCategory: UInt32 = 2

    private var skyGradient: SKSpriteNode?
    private var player: Player?
    private var ice: SKSpriteNode?

    private var jumps = 0
    
    override func didMove(to view: SKView) {
        skyGradient = childNode(withName: "skyGradient") as? SKSpriteNode

        player = childNode(withName: "player") as? Player
        if let player = self.player {
//            player.physicsBody?.categoryBitMask = kPlayerCategory
//            player.physicsBody?.contactTestBitMask = kIceCategory
//            player.physicsBody?.collisionBitMask = 0
        }

        ice = childNode(withName: "ice") as? SKSpriteNode
        if let ice = self.ice {
//            ground.physicsBody?.categoryBitMask = kIceCategory
//            ground.physicsBody?.contactTestBitMask = kPlayerCategory
//            ground.physicsBody?.collisionBitMask = 0
        }
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }

    //MARK: - Private methods


    //MARK: - Touch methods

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let inAir = player?.inAir else { return }

        if !inAir {
            jumps = 0
        }

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
