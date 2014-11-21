//
//  GameScene.swift
//  FontFamilies
//
//  Created by Romaniuk Sergey on 21.11.14.
//  Copyright (c) 2014 Romaniuk Sergey. All rights reserved.
//

import UIKit
import SpriteKit

class GameScene: SKScene {

    var familyIdx: Int = 0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
            super.init(size: size)
            showCurrentFamily()
    }
    
    func showCurrentFamily() {
        // 1
        removeAllChildren()
        // 2
        let familyName = UIFont.familyNames()[familyIdx] as String
        
        println("Family: \(familyName)  is \(familyIdx) from \(UIFont.familyNames().count)")
        
        // 3
        let fontNames =
        UIFont.fontNamesForFamilyName(familyName) as [String]
        // 4
        for (idx, fontName) in enumerate(fontNames) {
            let label = SKLabelNode(fontNamed: fontName)
            label.text = fontName
            label.position = CGPoint(
            x: size.width / 2,
            y: (size.height * (CGFloat(idx+1))) /
            (CGFloat(fontNames.count)+1))
            label.fontSize = 25
            label.verticalAlignmentMode = .Center
            addChild(label)
        
        
        }
    }
    
    override func touchesBegan(touches: NSSet,
        withEvent event: UIEvent) {
        familyIdx++;
        if familyIdx >= UIFont.familyNames().count {
        familyIdx = 0
        }
        showCurrentFamily()
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
