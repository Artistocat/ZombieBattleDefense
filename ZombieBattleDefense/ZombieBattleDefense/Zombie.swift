//
//  Zombie.swift
//  ZombieBattleDefense
//
//  Created by Vinnakota, Venkata K on 4/23/19.
//  Copyright © 2019 Wheeler, Aaron T. All rights reserved.
//

import UIKit

class Zombie: NSObject {
    
    var z: Zombie
    var health: Int
    init(z: Zombie, health: Int) {
        self.health = health
        self.z = z
    }

}
