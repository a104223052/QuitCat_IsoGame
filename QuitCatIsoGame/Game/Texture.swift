//
//  Texture.swift
//  QuitCatIsoGame
//
//  Created by 熊開智 on 2018/10/18.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import UIKit
import SpriteKit

func textureImage(tile:Tile, direction:Direction, action:Action) -> String {
    
    switch tile {
    case .Droid:
        switch action {
        case .Idle:
            switch direction {
            case .N:return "droid_n"
            case .NE:return "droid_ne"
            case .E:return "droid_e"
            case .SE:return "droid_se"
            case .S:return "droid_s"
            case .SW:return "droid_sw"
            case .W:return "droid_w"
            case .NW:return "droid_nw"
            }
        case .Move:
            switch direction {
            case .N:return "droid_n"
            case .NE:return "droid_ne"
            case .E:return "droid_e"
            case .SE:return "droid_se"
            case .S:return "droid_s"
            case .SW:return "droid_sw"
            case .W:return "droid_w"
            case .NW:return "droid_nw"
            }
        }
    case .Ground:
        return "ground"
    case .Wall:
        switch direction {
        case .N:return "wall_n"
        case .NE:return "wall_ne"
        case .E:return "wall_e"
        case .SE:return "wall_se"
        case .S:return "wall_s"
        case .SW:return "wall_sw"
        case .W:return "wall_w"
        case .NW:return "wall_nw"
        }
    }
}

protocol TextureObject {
    static var sharedInstance: TextureDroid {get}
    var texturesIso:[[SKTexture]?] {get}
    var textures2D:[[SKTexture]?] {get}
}

private let textureDroid = TextureDroid()

class TextureDroid: TextureObject  {
    
    class var sharedInstance: TextureDroid {
        return textureDroid
    }
    
    var texturesIso:[[SKTexture]?]
    var textures2D:[[SKTexture]?]
    
    init() {
        
        texturesIso = [[SKTexture]?](repeating: nil, count: 2)
        textures2D = [[SKTexture]?](repeating: nil, count: 2)
        
        //Idle
        texturesIso[Action.Idle.rawValue] = [
            SKTexture(imageNamed: "iso_3d_"+textureImage(tile: Tile.Droid, direction: Direction.N, action: Action.Idle)),
            SKTexture(imageNamed: "iso_3d_"+textureImage(tile: Tile.Droid, direction: Direction.NE, action: Action.Idle)),
            SKTexture(imageNamed: "iso_3d_"+textureImage(tile: Tile.Droid, direction: Direction.E, action: Action.Idle)),
            SKTexture(imageNamed: "iso_3d_"+textureImage(tile: Tile.Droid, direction: Direction.SE, action: Action.Idle)),
            SKTexture(imageNamed: "iso_3d_"+textureImage(tile: Tile.Droid, direction: Direction.S, action: Action.Idle)),
            SKTexture(imageNamed: "iso_3d_"+textureImage(tile: Tile.Droid, direction: Direction.SW, action: Action.Idle)),
            SKTexture(imageNamed: "iso_3d_"+textureImage(tile: Tile.Droid, direction: Direction.W, action: Action.Idle)),
            SKTexture(imageNamed: "iso_3d_"+textureImage(tile: Tile.Droid, direction: Direction.NW, action: Action.Idle)),
        ]
        
        //Move
        texturesIso[Action.Move.rawValue] = [
            SKTexture(imageNamed: "iso_3d_"+textureImage(tile: Tile.Droid, direction: Direction.N, action: Action.Move)),
            SKTexture(imageNamed: "iso_3d_"+textureImage(tile: Tile.Droid, direction: Direction.NE, action: Action.Move)),
            SKTexture(imageNamed: "iso_3d_"+textureImage(tile: Tile.Droid, direction: Direction.E, action: Action.Move)),
            SKTexture(imageNamed: "iso_3d_"+textureImage(tile: Tile.Droid, direction: Direction.SE, action: Action.Move)),
            SKTexture(imageNamed: "iso_3d_"+textureImage(tile: Tile.Droid, direction: Direction.S, action: Action.Move)),
            SKTexture(imageNamed: "iso_3d_"+textureImage(tile: Tile.Droid, direction: Direction.SW, action: Action.Move)),
            SKTexture(imageNamed: "iso_3d_"+textureImage(tile: Tile.Droid, direction: Direction.W, action: Action.Move)),
            SKTexture(imageNamed: "iso_3d_"+textureImage(tile: Tile.Droid, direction: Direction.NW, action: Action.Move)),
        ]
        
        //Idle
        textures2D[Action.Idle.rawValue] = [
            SKTexture(imageNamed: textureImage(tile: Tile.Droid, direction: Direction.N, action: Action.Idle)),
            SKTexture(imageNamed: textureImage(tile: Tile.Droid, direction: Direction.NE, action: Action.Idle)),
            SKTexture(imageNamed: textureImage(tile: Tile.Droid, direction: Direction.E, action: Action.Idle)),
            SKTexture(imageNamed: textureImage(tile: Tile.Droid, direction: Direction.SE, action: Action.Idle)),
            SKTexture(imageNamed: textureImage(tile: Tile.Droid, direction: Direction.S, action: Action.Idle)),
            SKTexture(imageNamed: textureImage(tile: Tile.Droid, direction: Direction.SW, action: Action.Idle)),
            SKTexture(imageNamed: textureImage(tile: Tile.Droid, direction: Direction.W, action: Action.Idle)),
            SKTexture(imageNamed: textureImage(tile: Tile.Droid, direction: Direction.NW, action: Action.Idle)),
        ]
        
        //Move
        textures2D[Action.Move.rawValue] = [
            SKTexture(imageNamed: textureImage(tile: Tile.Droid, direction: Direction.N, action: Action.Move)),
            SKTexture(imageNamed: textureImage(tile: Tile.Droid, direction: Direction.NE, action: Action.Move)),
            SKTexture(imageNamed: textureImage(tile: Tile.Droid, direction: Direction.E, action: Action.Move)),
            SKTexture(imageNamed: textureImage(tile: Tile.Droid, direction: Direction.SE, action: Action.Move)),
            SKTexture(imageNamed: textureImage(tile: Tile.Droid, direction: Direction.S, action: Action.Move)),
            SKTexture(imageNamed: textureImage(tile: Tile.Droid, direction: Direction.SW, action: Action.Move)),
            SKTexture(imageNamed: textureImage(tile: Tile.Droid, direction: Direction.W, action: Action.Move)),
            SKTexture(imageNamed: textureImage(tile: Tile.Droid, direction: Direction.NW, action: Action.Move)),
        ]
        
    }
    
}
