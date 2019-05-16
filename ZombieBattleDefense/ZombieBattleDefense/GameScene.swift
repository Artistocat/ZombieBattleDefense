/// Copyright (c) 2018 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SpriteKit

class GameScene: SKScene {
    var background = SKSpriteNode(imageNamed: "map")
    
    override func didMove(to view: SKView) {
        scaleMode = SKSceneScaleMode.resizeFill
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        //addChild(background)
    }
    
    func addZombie(level: Int){
        let zombie = SKSpriteNode(imageNamed: "zombie\(level)")
        
        var yLoc = size.height * 44 / 360
        zombie.zPosition = 99
        zombie.position = CGPoint(x: 0 - zombie.size.width / 2, y: yLoc)
        let level = Double(level) * 100.0
        addChild(zombie)
        var xLoc = CGFloat(Double(size.width) * 190.0 / 611.0)
        
        var movementArr = [SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval(Double(190.0 + Double(zombie.size.width)) / 2.0 / level))]
        yLoc = -size.height * 128.0 / 360.0
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval((128.0 - 44.0) / level)))
        xLoc = size.width * 72.0 / 611.0
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval((190 - 72.0) / level)))
        yLoc = -size.height * 300.0 / 360.0
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval((300.0 - 128.0) / level)))
        xLoc = size.width * 242.0 / 611.0
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval((242.0 - 72.0) / level)))
        yLoc = -size.height * 152.0 / 360.0
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval((300 - 152.0) / level)))
        xLoc = size.width * 280.0 / 611.0
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval((280.0 - 242) / level)))
        yLoc = -size.height * 54.0 / 360.0
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval((152 - 54.0) / level)))
        xLoc = size.width * 338.0 / 611.0
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval((338.0 - 280) / level)))
        yLoc = -size.height * 268.0 / 360.0
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval((268.0 - 54) / level)))
        xLoc = CGFloat(Double(size.width) + Double(zombie.size.width) / 2.0)
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval((Double(Double(size.width) + Double(zombie.size.width)) / 2.0 - 338) / level)))
        movementArr.append(SKAction.removeFromParent())
        zombie.run(SKAction.sequence(movementArr))
    }
}
