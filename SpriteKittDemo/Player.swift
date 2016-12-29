//
//  Player.swift
//  SpriteKittDemo
//
//  Created by MariaSaveleva on 23/12/2016.
//  Copyright © 2016 MariaSaveleva. All rights reserved.
//

import Foundation
import SpriteKit

class Player: SKSpriteNode, SKPhysicsContactDelegate {

    public var inAir = false

    public func playRunAnimation() {
        let run1 = SKTexture(imageNamed: "hero01")
        let run2 = SKTexture(imageNamed: "hero02")
        let run3 = SKTexture(imageNamed: "hero03")
        let run4 = SKTexture(imageNamed: "hero04")

        let runTexture = [run1, run2, run3, run4]
        let runAnimation = SKAction.animate(with: runTexture, timePerFrame: 0.1, resize: false, restore: true)
        let foreverRun = SKAction.repeatForever(runAnimation)

        run(foreverRun) 
    }

    public func playJumpAnimation() {
        //todo: implement
    }

}
