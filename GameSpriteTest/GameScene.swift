//
//  GameScene.swift
//  GameSpriteTest
//
//  Created by PATRICIA S SIQUEIRA on 27/02/21.
//

import UIKit
import SpriteKit

class GameScene: SKScene {
    let retangulo = SKShapeNode(rectOf: CGSize(width: 100, height: 100))
    let bolinha:SKShapeNode = SKShapeNode(circleOfRadius: 50)
    
    //let particula = SKEmitterNode(fileNamed: "Particula.sks")
    
    
    
    override func didMove(to view: SKView) {
        
       self.backgroundColor = .white
        
        retangulo.fillColor = .blue
        retangulo.strokeColor = .green
        retangulo.lineWidth = 3
        retangulo.position = CGPoint(x: 200, y: 300)
        self.addChild(retangulo)
        
        retangulo.physicsBody = SKPhysicsBody(rectangleOf: retangulo.frame.size)
        retangulo.physicsBody?.isDynamic = true
        retangulo.physicsBody?.allowsRotation = true
 
        let ret = CGRect(x: 0, y: 0, width: frame.width - 20, height: 10)
        let chao = SKShapeNode(rect: ret)
        chao.fillColor = .yellow
        chao.physicsBody = SKPhysicsBody(rectangleOf: chao.frame.size, center: CGPoint(x: (frame.width - 20) / 2, y: 5))
        chao.physicsBody?.isDynamic = false
        chao.position = CGPoint(x: 10, y: 20)
        addChild(chao)
        
        bolinha.fillColor = .gray
        bolinha.strokeColor = .green
        bolinha.lineWidth = 3
        bolinha.position = CGPoint(x: 100, y: 300)
        self.addChild(bolinha)
        
        bolinha.physicsBody = SKPhysicsBody(circleOfRadius: bolinha.frame.size.width / 2)
        bolinha.physicsBody?.isDynamic = true
        bolinha.physicsBody?.allowsRotation = true
        
        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        borderBody.friction = 0
        self.physicsBody = borderBody
        
//        particula?.position = CGPoint(x: self.frame.maxX, y: self.frame.maxY)
//        self.addChild(particula!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        bolinha.physicsBody?.velocity = CGVector.zero
        bolinha.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 100))
        
        retangulo.physicsBody?.velocity = CGVector.zero
        retangulo.physicsBody?.applyImpulse(CGVector(dx: -30, dy: 100))
        
        for touch in touches{
            let location = touch.location(in: self)
            print("x:\(location.x), y: \(location.y)")
            criarParticula(CGPoint(x: location.x, y: location.y))
        }
        
    }
    
    func criarParticula(_ p:CGPoint) {
        let particula:SKTexture = SKTexture(imageNamed: "Small_Rock")
        let minhaParticula:SKEmitterNode = SKEmitterNode()
        minhaParticula.particleTexture = particula
        minhaParticula.position = CGPoint(x: p.x, y: p.y)
        minhaParticula.particleBirthRate = 100
        minhaParticula.numParticlesToEmit = 7
        minhaParticula.particleLifetime = 1.3
        minhaParticula.particleTexture?.filteringMode = .nearest
        minhaParticula.xAcceleration = 0
        minhaParticula.yAcceleration = 0
        minhaParticula.particleSpeed = 100
        minhaParticula.particleSpeedRange = 200
        minhaParticula.particleRotationSpeed  = -10
        minhaParticula.particleRotationRange = 4
        minhaParticula.emissionAngle = CGFloat(Double.pi * 2)
        minhaParticula.emissionAngleRange = CGFloat(Double.pi * 2)
        minhaParticula.particleColorAlphaSpeed = 0.1
        minhaParticula.particleColorAlphaRange = 1
        minhaParticula.particleAlphaSequence = SKKeyframeSequence(keyframeValues: [1,0], times: [0,1])
        minhaParticula.particleScaleSequence = SKKeyframeSequence(keyframeValues: [3,0.5], times: [0,1])
        self.addChild(minhaParticula)
        minhaParticula.run(SKAction.sequence([SKAction.wait(forDuration: 2), SKAction.removeFromParent()]))
        
        
    }
        
//        let sprite:SKSpriteNode = SKSpriteNode(imageNamed: "larry_Walk1")
//        sprite.position = CGPoint(x: frame.midX, y: frame.midY)
//        self.addChild(sprite)
//
//        var texto:SKLabelNode = SKLabelNode()
//        texto = SKLabelNode(text: "Game Scene")
//        texto.fontColor = .red
//        texto.fontSize = 21
//        texto.fontName = "Arial Bold"
//        texto.verticalAlignmentMode = .center
//        texto.horizontalAlignmentMode = .center
//
//        texto.position = CGPoint(x: self.scene!.frame.midX, y: self.scene!.frame.midY * 1.5)
//        self.addChild(texto)
//
//        var imagens:[SKTexture] = []
//        let meuAtlas:SKTextureAtlas = SKTextureAtlas(named: "larry_walk")

//        for i in 1...meuAtlas.textureNames.count {
//            imagens.append(SKTexture(imageNamed: "larry_Walk\(i)"))
//        }
        
//        for i in 1...6 {
//            imagens.append(SKTexture(imageNamed: "larry_Walk\(i)"))
//        }
//        
//        let animaFrames:SKAction = SKAction.animate(with: imagens, timePerFrame: 0.08)
//
//        sprite.run(SKAction.repeatForever(animaFrames))
        
        
//        let acaoMove: SKAction = SKAction.move(to: CGPoint(x: 300, y: 300), duration: 2.0)
//        let acaoFade:SKAction = SKAction.fadeOut(withDuration: 1.0)
//        let acaoEspera:SKAction = SKAction.wait(forDuration: 2.0)
//        let acaoApagar:SKAction = SKAction.removeFromParent()
//        let sequencia:SKAction = SKAction.sequence([acaoMove,acaoEspera,acaoFade, acaoApagar])
//        //sprite.run(sequencia)
//
//
//        let acaoVai:SKAction = SKAction.move(to: CGPoint(x: 100, y: 200), duration: 1.0)
//        let acaoVolta:SKAction = SKAction.move(to: CGPoint(x: -100, y: -200), duration: 1.0)
//
//        sprite.run(SKAction.repeatForever(SKAction.sequence([acaoVai,acaoVolta])))
//
//        let song = SKAction.playSoundFileNamed("song", waitForCompletion: false)
//        self.run(song)
        
//        let bolinha:SKShapeNode = SKShapeNode(circleOfRadius: 25)
//        bolinha.fillColor = .red
//        bolinha.strokeColor = .green
//        bolinha.lineWidth = 3
//        bolinha.position = CGPoint(x: 100, y: 100)
//        self.addChild(bolinha)
//
//        let retangulo:SKShapeNode = SKShapeNode(rectOf: CGSize(width: 100, height: 100))
//        retangulo.fillColor = .blue
//        retangulo.strokeColor = .green
//        retangulo.lineWidth = 3
//        retangulo.position = CGPoint(x: 200, y: 100)
//        self.addChild(retangulo)
    
}
