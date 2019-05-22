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
    
    var location = CGPoint.zero
    //var touch = SKSpriteNode.
    
    let mapSprite = SKSpriteNode(imageNamed: "map")
    
    //Sprite Nodes
    
    let cannonSprite = SKSpriteNode(imageNamed: "Cannon")
    let gunTowerSprite = SKSpriteNode(imageNamed: "gunTower")
    let machineGunSprite = SKSpriteNode(imageNamed: "machineGun")
    let sniperSprite = SKSpriteNode(imageNamed: "sniper")
    let landmineSprite = SKSpriteNode(imageNamed: "landmine")
    let tacticalSpike = SKSpriteNode(imageNamed: "tacticalSpike")
    
    var cannonVerify = false
    var gunTowerVerify = false
    var machineGunVerify = false
    var sniperVerify = false
    var landmineVerify = false
    var tacticalVerify = false
    
    
    //make Sprite Nodes appear on screen (starting location of Sprite Nodes)
    func view()
    {
        
        
    }

 
    
    //touch SpriteNode and click on a location on the screen to place Sprite Node
    func touchTactical(_ touches:Set<UITouch>, with event: UIEvent?)
    {
        guard let touch = touches.first else {return}
        location = touch.location(in: tacticalSpike)
        
        if (location == tacticalSpike.position)
        {
            tacticalVerify = true
        }
    }
    func touchLandmine(_ touches:Set<UITouch>, with event: UIEvent?)
    {
        guard let touch = touches.first else {return}
        location = touch.location(in: landmineSprite)
        
        if (location == cannonSprite.position)
        {
            landmineVerify = true
        }
    }
    func touchSniper(_ touches:Set<UITouch>, with event: UIEvent?)
    {
        guard let touch = touches.first else {return}
        location = touch.location(in: sniperSprite)
        
        if (location == sniperSprite.position)
        {
            sniperVerify = true
        }
    }
    func touchCannon(_ touches:Set<UITouch>, with event: UIEvent?)
    {
      guard let touch = touches.first else {return}
        location = touch.location(in: cannonSprite)
        
        if (location == cannonSprite.position)
        {
            cannonVerify = true
        }
    }
    func touchGunTower(_ touches:Set<UITouch>, with event: UIEvent?)
    {
        guard let touch = touches.first else {return}
        location = touch.location(in: gunTowerSprite)
        
        if (location == gunTowerSprite.position)
        {
            gunTowerVerify = true
        }
    }
    func touchMachineGun(_ touches:Set<UITouch>, with event: UIEvent?)
    {
        guard let touch = touches.first else {return}
        location = touch.location(in: machineGunSprite)
        
        if (location == machineGunSprite.position)
        {
            machineGunVerify = true
        }
    }
    
    func newLocation(_ touches: Set<UITouch>, with event: UIEvent)
    {
        guard let touch = touches.first else {return}
        location = touch.location(in: mapSprite)
        validLocation(location: location)
    }
    func found(location: CGPoint)
    {
        
    }
    
    
    
    //check if location is valid (not on the path)
    func validLocation(location: CGPoint)
    {
//       color = mapSprite.color
//        if (color = UIGraphicsGetImageFromCurrentImageContext())
//        {
//
//        }
    }
    
    //location is updated for the placement, but is no longer updated once it is placed
    //update location of CannonSprite
    func updateCannon(_ node: SKSpriteNode, location: CGPoint)
    {
        if (cannonVerify == true)
        {
            cannonSprite.position = location
        }
    }
    
    //update location of machineGunSprite
    func updateMachineGun(_ node: SKSpriteNode, location: CGPoint)
    {
        if (machineGunVerify == true)
        {
            machineGunSprite.position = location
        }
    }
    
    //update location of gunTower
    func updateGunTower(_ node: SKSpriteNode, location: CGPoint)
    {
        if (gunTowerVerify == true)
        {
            gunTowerSprite.position = location
        }
    }
    
    func updateSniper(_ node: SKSpriteNode, location: CGPoint)
    {
       if (sniperVerify == true)
       {
          sniperSprite.position = location
        }
    }
    
    func updateLandmine(_ node: SKSpriteNode, location: CGPoint)
    {
        if (landmineVerify == true)
        {
            landmineSprite.position = location
        }
    }
    func updateTacticalSpike(_ node: SKSpriteNode, location: CGPoint)
    {
            if (tacticalVerify == true)
            {
                tacticalSpike.position = location
        }
    }
}
