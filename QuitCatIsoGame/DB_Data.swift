//
//  DB_Data.swift
//  QuitCatIsoGame
//
//  Created by Gary on 2018/10/25.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import Foundation
//import Firebase


struct Usersdata {
    let uid:String?
    let name : String?
    let smokeage  : Int?
    let smokeaddiction : Int?
    let smokecount : Int?
    let days : Int?
    let gold : Int?
    let score : Int?
    let fish : Int?
    let shit : Int?
    let userimage  : String?
//    init(aDoc: DocumentSnapshot) {
//        self.uid = aDoc.get("uid") as? String ?? ""
//        self.name = aDoc.get("name") as? String ?? ""
//        self.smokeage = aDoc.get("smokeage") as? Int ?? 0
//        self.smokeaddiction = aDoc.get("smokeaddiction") as? Int ?? 0
//        self.smokecount = aDoc.get("smokecount") as? Int ?? 0
//        self.days = aDoc.get("days") as? Int ?? 0
//        self.gold = aDoc.get("gold") as? Int ?? 0
//        self.score = aDoc.get("score") as? Int ?? 0
//        self.fish = aDoc.get("fish") as? Int ?? 0
//        self.shit = aDoc.get("shit") as? Int ?? 0
//        self.userimage = aDoc.get("userimage") as? String ?? ""
//    }
}

struct Friend {
    let uid:String?
    let friendName:String?
    let promise:String?
//    init(aDoc:DocumentSnapshot){
//        self.uid = aDoc.get("uid") as? String ?? ""
//        self.friendName = aDoc.get("friendName") as? String ?? ""
//        self.promise = aDoc.get("promise") as? String ?? ""
//    }
}
struct Pet {
    let life:Int?
    let hungry:Int?
    let clean:Int?
    let edu:Int?
    let mood:Int?
//    init(aDoc:DocumentSnapshot){
//        self.life = aDoc.get("life") as? Int ?? 0
//        self.hungry = aDoc.get("hungry") as? Int ?? 0
//        self.clean = aDoc.get("clean") as? Int ?? 0
//        self.edu = aDoc.get("edu") as? Int ?? 0
//        self.mood = aDoc.get("mood") as? Int ?? 0
//    }
}
struct Pet_Environment {
    let oxygen:Int?
    let dirtyair:Int?
    let co2:Int?
    
//    init(aDoc:DocumentSnapshot){
//        self.oxygen = aDoc.get("oxygen") as? Int ?? 0
//        self.dirtyair = aDoc.get("dirtyair") as? Int ?? 0
//        self.co2 = aDoc.get("co2") as? Int ?? 0
//    }
}
struct Useritem {
    let classicfeed:Int?
    let deliciousfeed:Int?
    let novalleyfeed:Int?
    let classiccan:Int?
    let fishcan:Int?
//    init(aDoc:DocumentSnapshot){
//        self.classicfeed = aDoc.get("classicfeed") as? Int ?? 0
//        self.deliciousfeed = aDoc.get("deliciousfeed") as? Int ?? 0
//        self.novalleyfeed = aDoc.get("novalleyfeed") as? Int ?? 0
//        self.classiccan = aDoc.get("classiccan") as? Int ?? 0
//        self.fishcan = aDoc.get("fishcan") as? Int ?? 0
//    }
}

struct Smokerecord {
    
    let time:String?
    let ratio:String?
    let doing:String?
    let daysmokecount:String?
    
//    init(aDoc:DocumentSnapshot){
//        self.time = aDoc.get("time") as? String ?? ""
//        self.ratio = aDoc.get("ratio") as? String ?? ""
//        self.doing = aDoc.get("doing") as? String ?? ""
//        self.daysmokecount = aDoc.get("daysmokecount") as? String ?? ""
//    }
}

struct Smokerecord_Mood {
    let awesome:Int?
    let sin:Int?
    let sad:Int?
    let comfortable:Int?
    let angry:Int?
//    init(aDoc:DocumentSnapshot){
//        self.awesome = aDoc.get("awesome") as? Int ?? 0
//        self.sin = aDoc.get("sin") as? Int ?? 0
//        self.sad = aDoc.get("sad") as? Int ?? 0
//        self.comfortable = aDoc.get("comfortable") as? Int ?? 0
//        self.angry = aDoc.get("angry") as? Int ?? 0
//    }
}
struct Smokerecord_Situation {
    let boring:Int?
    let hungry:Int?
    let full:Int?
    let fatigue:Int?
    let outofspirits:Int?
    let getup:Int?
    let invite:Int?
//    init(aDoc:DocumentSnapshot){
//        self.boring = aDoc.get("boring") as? Int ?? 0
//        self.hungry = aDoc.get("hungry") as? Int ?? 0
//        self.full = aDoc.get("full") as? Int ?? 0
//        self.fatigue = aDoc.get("fatigue") as? Int ?? 0
//        self.outofspirits = aDoc.get("outofspirits") as? Int ?? 0
//        self.getup = aDoc.get("getup") as? Int ?? 0
//        self.invite = aDoc.get("invite") as? Int ?? 0
//    }
}
struct House {
    let television:String?
    
//    init(aDoc:DocumentSnapshot){
//        self.television = aDoc.get("television") as? String ?? ""
//    }
}

