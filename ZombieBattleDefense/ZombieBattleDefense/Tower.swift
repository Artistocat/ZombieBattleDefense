//
//  Tower.swift
//  ZombieBattleDefense
//
//  Created by Vinnakota, Venkata K on 4/23/19.
//  Copyright © 2019 Wheeler, Aaron T. All rights reserved.
//
import SpriteKit
import CoreMotion
import UIKit

class Tower: NSObject {
    var damage: Int
    init(damage: Int) {
        self.damage = damage
    }
    
     let cannonSprite = SKSpriteNode(imageNamed:"Cannon")
     let gunTowerSprite = SKSpriteNode(imageNamed: "gunTower")
     let machineGunSprite = SKSpriteNode(imageNamed: "machineGun")
 
}
