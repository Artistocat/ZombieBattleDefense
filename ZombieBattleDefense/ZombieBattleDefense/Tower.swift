//
//  Tower.swift
//  ZombieBattleDefense
//
//  Created by Vinnakota, Venkata K on 4/23/19.
//  Copyright © 2019 Wheeler, Aaron T. All rights reserved.
//

import UIKit

class Tower: NSObject {
    var t: Tower
    var damage: Int
    init(t: Tower, damage: Int) {
        self.damage = damage
        self.t = t
    }
}
