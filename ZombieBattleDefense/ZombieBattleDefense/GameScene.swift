
import SpriteKit

class GameScene: SKScene {
    var background = SKSpriteNode(imageNamed: "map")
    
    override func didMove(to view: SKView) {
        scaleMode = SKSceneScaleMode.resizeFill
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        background.zPosition = 0
        background.scale(to: self.size)
        addChild(background)
    }
    
    func placeMachineGun(x: CGFloat, y: CGFloat) {
        let tower = SKSpriteNode(imageNamed: "machineGun")
        tower.position = CGPoint(x: x, y: size.height - y)
        tower.zPosition = 90
        addChild(tower)
    }
    
    func placeGunTower(x: CGFloat, y: CGFloat) {
        let tower = SKSpriteNode(imageNamed: "gunTower")
        tower.position = CGPoint(x: x, y: size.height - y)
        tower.zPosition = 90
        addChild(tower)
    }
    
    func placeCannon(x: CGFloat, y: CGFloat) {
        let tower = SKSpriteNode(imageNamed: "Cannon")
        tower.position = CGPoint(x: x, y: size.height - y)
        tower.zPosition = 90
        addChild(tower)
    }
    
    func placeLandmine(x: CGFloat, y: CGFloat) {
        let tower = SKSpriteNode(imageNamed: "landmine")
        tower.position = CGPoint(x: x, y: size.height - y)
        tower.zPosition = 90
        addChild(tower)
    }

    func placeSniper(x: CGFloat, y: CGFloat) {
        let tower = SKSpriteNode(imageNamed: "sniper")
        tower.position = CGPoint(x: x, y: size.height - y)
        tower.zPosition = 90
        addChild(tower)
    }
    
    func placeTacticalSpike(x: CGFloat, y: CGFloat) {
        let tower = SKSpriteNode(imageNamed: "tacticalSpike")
        tower.position = CGPoint(x: x, y: size.height - y)
        tower.zPosition = 90
        addChild(tower)
    }
    
    func addZombie(level: Int){
        let zombie = SKSpriteNode(imageNamed: "zombie\(level)")
        
        var yLoc = size.height * (size.height - 44) / 360
        zombie.zPosition = 99
        zombie.position = CGPoint(x: 0 - zombie.size.width / 2, y: yLoc)
        let level = Double(level) * 100.0
        addChild(zombie)
        var xLoc = CGFloat(Double(size.width) * 190.0 / 611.0)
        
        var movementArr = [SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval(Double(190.0 + Double(zombie.size.width)) / 2.0 / level))]
        yLoc = size.height * (size.height - 128.0) / 360.0
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval((128.0 - 44.0) / level)))
        xLoc = size.width * 72.0 / 611.0
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval((190 - 72.0) / level)))
        yLoc = size.height * (size.height - 300.0) / 360.0
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval((300.0 - 128.0) / level)))
        xLoc = size.width * 242.0 / 611.0
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval((242.0 - 72.0) / level)))
        yLoc = size.height * (size.height - 152.0) / 360.0
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval((300 - 152.0) / level)))
        xLoc = size.width * 280.0 / 611.0
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval((280.0 - 242) / level)))
        yLoc = size.height * (size.height - 54.0) / 360.0
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval((152 - 54.0) / level)))
        xLoc = size.width * 338.0 / 611.0
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval((338.0 - 280) / level)))
        yLoc = size.height * (size.height - 268.0) / 360.0
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval((268.0 - 54) / level)))
        xLoc = CGFloat(Double(size.width) + Double(zombie.size.width) / 2.0)
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval(Double((360.0 + (zombie.size.width / 2.0) - 338)) / level)))
            //((Double(Double(size.width) + Double(zombie.size.width)) / 2.0) - 338) / level))
        movementArr.append(SKAction.removeFromParent())
        zombie.run(SKAction.sequence(movementArr))
    }
}
