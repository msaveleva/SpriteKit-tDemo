//
//  Platform.swift
//  SpriteKittDemo
//
//  Created by MariaSaveleva on 27/12/2016.
//  Copyright © 2016 MariaSaveleva. All rights reserved.
//

import Foundation
import SpriteKit

class Platform: SKShapeNode {

    //todo: make custom init
    public var size = CGSize.zero

    public func configure() {
        fillColor = .platformColor()
    }
    
}
