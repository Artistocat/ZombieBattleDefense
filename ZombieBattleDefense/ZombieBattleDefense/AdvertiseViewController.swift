//
//  AdvertiseViewController.swift
//  ZombieBattleDefense
//
//  Created by Webb, Carter J on 4/25/19.
//  Copyright © 2019 Wheeler, Aaron T. All rights reserved.
//

import UIKit
import MultipeerConnectivity
class AdvertiseViewController: UIViewController{
   
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appDelegate.mpcManager.serviceAdvertiser.startAdvertisingPeer()
        print("Has advertise")
        self.appDelegate.mpcManager.valueWasChanged = {
            self.performSegue(withIdentifier: "HostGame", sender: nil)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var hostLabel: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
