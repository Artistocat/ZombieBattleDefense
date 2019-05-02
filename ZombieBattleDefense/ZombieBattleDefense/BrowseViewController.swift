//
//  BrowseViewController.swift
//  ZombieBattleDefense
//
//  Created by Webb, Carter J on 4/25/19.
//  Copyright © 2019 Wheeler, Aaron T. All rights reserved.
//

import UIKit
import MultipeerConnectivity
class BrowseViewController: UIViewController, ZombieServiceDelegate {
    func connected(peerID: MCPeerID) {
        print("call")
        joinLabel.text = "\(peerID.displayName) is connected"
    }
    
    
    func connectedDevicesChanged(manager: ZombieService, connectedDevices: [String])
    {
        
    }
    
    func zombieChanged(manager: ZombieService, zombieString: String) {
        
    }
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        appDelegate.mpcManager.serviceBrowser.startBrowsingForPeers()
        print("Has browse")
        
        self.appDelegate.mpcManager.valueWasChanged = {
            self.performSegue(withIdentifier: "JoinGame", sender: nil)
        }
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var joinLabel: UILabel!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
