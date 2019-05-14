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
    func addZombie(level: Int){
        let zombie = SKSpriteNode(imageNamed: "zombie\(level)")
        
        var yLoc = size.height * 44 / 360
        
        zombie.position = CGPoint(x: 0 - zombie.size.width / 2, y: yLoc)
        
        addChild(zombie)
        var xLoc = size.width * 190 / 611
        let actualDuration = level
        var movementArr = [SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval(actualDuration))]
        yLoc = size.height * 128 / 360
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval(actualDuration)))
        xLoc = size.width * 72 / 611
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval(actualDuration)))
        yLoc = size.height * 300 / 360
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval(actualDuration)))
        xLoc = size.width * 242 / 611
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval(actualDuration)))
        yLoc = size.height * 152 / 360
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval(actualDuration)))
        xLoc = size.width * 280 / 611
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval(actualDuration)))
        yLoc = size.height * 54 / 360
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval(actualDuration)))
        xLoc = size.width * 338 / 611
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval(actualDuration)))
        yLoc = size.height * 268 / 360
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval(actualDuration)))
        xLoc = size.width + zombie.size.width / 2
        movementArr.append(SKAction.move(to: CGPoint(x: xLoc, y: yLoc), duration: TimeInterval(actualDuration)))
        movementArr.append(SKAction.removeFromParent())
        zombie.run(SKAction.sequence(movementArr))
    }
}
