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

    let jumpUp = SKAction.moveBy(x: 0, y: 50, duration: 0.3)
    let fallBack = SKAction.moveBy(x: 0, y: -50, duration: 0.3)
    var jumpAction = SKAction()
    
    override func didMove(to view: SKView) {
        skyGradient = childNode(withName: "skyGradient") as? SKSpriteNode
        if let skyGradient = self.skyGradient {
            //todo: configure
        }

        player = childNode(withName: "player") as? SKSpriteNode
        if let player = self.player {
            //todo: configure player
            //todo: add player jump animation for touch up and down
        }

        jumpAction = SKAction.sequence([jumpUp, fallBack])
    }
    
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
        if player?.action(forKey: "jump") == nil {
            player?.run(jumpAction, withKey:"jump")
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
