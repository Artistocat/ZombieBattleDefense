//
//  GameViewController.swift
//  ZombieBattleDefense
//
//  Created by Wheeler, Aaron T on 4/25/19.
//  Copyright © 2019 Wheeler, Aaron T. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    let zombieService = ZombieService()
    //var zombies = [Zombie]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    }
    
    func sendZombie(speed: Int, health: Int) {
        zombieService.send(zombieString: "s\(speed)h\(health)")
    }
}
extension GameViewController : ZombieServiceDelegate {
    
    func connectedDevicesChanged(manager: ZombieService, connectedDevices: [String]) {
        OperationQueue.main.addOperation {
            //self.connectionsLabel.text = "\(connectedDevices)"
        }
    }
    
    func zombieReceived(manager: ZombieService, zombieString: String) {
        //TODO
        //zombieString will be formatted like so: s000h0000 where s stands for speed the zero's can be any number with any length which is the speed and h representing the health in much the same way
        
    }
}
