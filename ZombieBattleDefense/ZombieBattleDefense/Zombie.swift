//
//  Zombie.swift
//  ZombieBattleDefense
//
//  Created by Vinnakota, Venkata K on 4/23/19.
//  Copyright © 2019 Wheeler, Aaron T. All rights reserved.
//

import UIKit
import CoreMotion
import UIKit

class Zombie: NSObject {
    var health: Int
    var speed: Int
    static let zombieSprite = SKSpriteNode(imageNamed: "zombie")
    
    init(health: Int, speed: Int) {
        self.health = health
        self.speed = speed
    }
    
    //make sprite nodes appear on screen. All zombies will start at the same spot, the beginning of the track
    func view()
    {
        zombieSprite.position = CGPoint(x: 0, y: 300) //TODO set the x and y location to the beginning of the track. x will probably be 0
        addChild(zombieSprite)
    }
    
    //update location of zombie.
    func updateLocation(_ node: SKSpriteNode, location: CGPoint) {
        
    }
    
    func damage(damage: Int) {
        health -= damage
    }
}
