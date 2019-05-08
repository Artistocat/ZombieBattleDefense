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
    //let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var zombieService = (UIApplication.shared.delegate as! AppDelegate).mpcManager!
    var zombies = [Zombie]()
    var towers = [Tower]()
    
    var jCash = 500 {
        didSet {
            DispatchQueue.main.async {
                self.moneyLabel.text = "\(self.jCash)"
            }
        }
    }
    var lives = 100 {
        didSet {
            DispatchQueue.main.async {
                self.livesLabel.text = "\(self.lives)"
                if self.lives<=0
                {
                    self.zombieService.session.disconnect()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //let scene = GameScene(size: view.bounds.size)
        //let skView = view as! SKView
        //skView.showsFPS = true
        //skView.showsNodeCount = true
        //skView.ignoresSiblingOrder = true
        //scene.scaleMode = .resizeFill
        //skView.presentScene(scene)
        lives = 100
        jCash = 500
        zombieService.zombieGot = {
            self.zombieReceived(manager: self.zombieService, zombieString: self.zombieService.dataFlopper)
        }
        zombieService.endGame = {
             DispatchQueue.main.async {
            self.zombieService=ZombieService()
            print((UIApplication.shared.delegate as! AppDelegate).mpcManager!.session)
            self.performSegue(withIdentifier: "Return", sender: nil)
            }
        }
        
    }
    @IBOutlet weak var livesLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    let zombieMultiplier = 1
    func sendZombie(speed: Int, health: Int) {
        jCash -= 100 * (speed + health)
        zombieService.send(zombieString: "s\(speed)h\(health)")
    }
    
    @IBAction func zombie1(_ sender: UIButton) {
        sendZombie(speed: zombieMultiplier, health: zombieMultiplier)
    }
    @IBAction func zombie2(_ sender: UIButton) {
        sendZombie(speed: 2 * zombieMultiplier, health: 2 * zombieMultiplier)
    }
    @IBAction func zombie3(_ sender: UIButton) {
        sendZombie(speed: 3 * zombieMultiplier, health: 3 * zombieMultiplier)
    }
    @IBAction func zombie4(_ sender: UIButton) {
        sendZombie(speed: 4 * zombieMultiplier, health: 4 * zombieMultiplier)
    }
    @IBAction func zombie5(_ sender: UIButton) {
        sendZombie(speed: 5 * zombieMultiplier, health: 5 * zombieMultiplier)
    }
    @IBAction func zombie6(_ sender: UIButton) {
        sendZombie(speed: 6 * zombieMultiplier, health: 6 * zombieMultiplier)
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
        var speedStr = ""
        var healthStr = ""
        var passedH = false
        for character in zombieString {
            if character == "s" {
                continue
            }
            if character == "h" {
                passedH = true
                continue
            }
            if passedH {
                healthStr += String(character)
            }
            else {
                speedStr += String(character)
            }
        }
        
        let speed = Int(speedStr)
        let health = Int(healthStr)
        //print("zRecieved")
        zombies.append(Zombie(health: health!, speed: speed!))
        lives-=5
    }
}
