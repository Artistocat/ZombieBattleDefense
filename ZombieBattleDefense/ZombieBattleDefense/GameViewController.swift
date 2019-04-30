//
//  GameViewController.swift
//  ZombieBattleDefense
//
//  Created by Wheeler, Aaron T on 4/25/19.
//  Copyright © 2019 Wheeler, Aaron T. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    }
}
