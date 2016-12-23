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

    private var skyGradient: SKSpriteNode?
    private var player: SKSpriteNode?
    private var ground: SKSpriteNode?
    
    override func didMove(to view: SKView) {
        skyGradient = childNode(withName: "skyGradient") as? SKSpriteNode
        if let skyGradient = self.skyGradient {
            //todo: configure
        }

        player = childNode(withName: "player") as? SKSpriteNode
        if let player = self.player {
            //todo: configure player
            player.physicsBody?.isDynamic = true
        }

        ground = childNode(withName: "ground") as? SKSpriteNode
        if let ground = self.ground {
            ground.physicsBody = SKPhysicsBody(rectangleOf: ground.frame.size)
            //This makes body static and allows the physics engine to optimize its calculations ignoring any forces for this body. 
            ground.physicsBody?.isDynamic = false
        }
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }

    //MARK: - Private methods


    //MARK: - Touch methods

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //todo: add check – ignore if in air. Allow double jump.
        player?.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 200.0)) //impulse vs force?
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }

}
