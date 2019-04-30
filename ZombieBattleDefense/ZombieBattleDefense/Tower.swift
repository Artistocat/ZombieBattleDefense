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
    
    //Sprite Nodes
     let cannonSprite = SKSpriteNode(imageNamed:"Cannon")
     let gunTowerSprite = SKSpriteNode(imageNamed: "gunTower")
     let machineGunSprite = SKSpriteNode(imageNamed: "machineGun")
     let bulletsSprite = SKSpriteNode(imageNamed: "bullet")
    
    
    //make Sprite Nodes appear on screen (starting location of Sprite Nodes)
    func view()
    {
        /*
        cannonSprite.position = CGPoint(x: , y: )
        addChild(cannonSprite)
        
        gunTowerSprite.position = CGPoint(x:, y:)
        addChild(gunTowerSprite)
         
        machineGunSprite.position = CGPoint(x:, y:)
        addChild(machineGunSprite)
         
        updateCannon(cannonSprite, validLocation())
        
         
        */
    }
 
    
    //touch SpriteNode and click on a location on the screen to place Sprite Node
    func touchesEnded(_ touches:Set<UITouch>, with event: UIEvent?)
    {

    }
    
    //check if location is valid (not on the path)
    func validLocation(location:CGPoint)
    {
        
    }
    
    //update location of CannonSprite
    func updateCannon(_ node: SKSpriteNode, location: CGPoint)
    {
        
    }
    
    //update location of machineGunSprite
    func updateMachineGun(_ node: SKSpriteNode, location: CGPoint)
    {
        
    }
    
    //update location of gunTower
    func updateGunTower(_ node: SKSpriteNode, location: CGPoint)
    {
        
    }
    
    //SpriteNode launches missiles at zombies
    func launch()
    {
        
    }
}
