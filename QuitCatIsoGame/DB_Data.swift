//
//  DB_Data.swift
//  QuitCatIsoGame
//
//  Created by Gary on 2018/10/25.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import Foundation
import Firebase


struct Usersdata {
    let uid:String?
    let facebook:String?
    let google : String?
    let name : String?
    let age : Int?
    let birthday : String?
    let smokeage  : Int?
    let smokeaddiction : Int?
    let smokebrand  : String?
    let gold : Int?
    let score : Int?
    let fish : Int?
    let shit : Int?
    let userimage  : String?
    init(aDoc: DocumentSnapshot) {
        self.uid = aDoc.get("uid") as? String ?? ""
        self.facebook = aDoc.get("facebook") as? String ?? ""
        self.google = aDoc.get("google") as? String ?? ""
        self.name = aDoc.get("name") as? String ?? ""
        self.age = aDoc.get("age") as? Int ?? 0
        self.birthday = aDoc.get("birthday") as? String ?? ""
        self.smokeage = aDoc.get("smokeage") as? Int ?? 0
        self.smokeaddiction = aDoc.get("smokeaddiction") as? Int ?? 0
        self.smokebrand = aDoc.get("smokebrand") as? String ?? ""
        self.gold = aDoc.get("gold") as? Int ?? 0
        self.score = aDoc.get("score") as? Int ?? 0
        self.fish = aDoc.get("fish") as? Int ?? 0
        self.shit = aDoc.get("shit") as? Int ?? 0
        self.userimage = aDoc.get("userimage") as? String ?? ""
    }
}
struct Friend {
    let uid:String?
    let friendName:String?
    let promise:String?
    init(aDoc:DocumentSnapshot){
        self.uid = aDoc.get("uid") as? String ?? ""
        self.friendName = aDoc.get("friendName") as? String ?? ""
        self.promise = aDoc.get("promise") as? String ?? ""
    }
}
struct Pet {
    let life:Int?
    let hungry:Int?
    let clean:Int?
    let edu:Int?
    let mood:Int?
    init(aDoc:DocumentSnapshot){
        self.life = aDoc.get("life") as? Int ?? 0
        self.hungry = aDoc.get("hungry") as? Int ?? 0
        self.clean = aDoc.get("clean") as? Int ?? 0
        self.edu = aDoc.get("edu") as? Int ?? 0
        self.mood = aDoc.get("mood") as? Int ?? 0
    }
}
struct Pet_Environment {
    let oxygen:Int?
    let dirtyair:Int?
    let co2:Int?
    
    init(aDoc:DocumentSnapshot){
        self.oxygen = aDoc.get("oxygen") as? Int ?? 0
        self.dirtyair = aDoc.get("dirtyair") as? Int ?? 0
        self.co2 = aDoc.get("co2") as? Int ?? 0
    }
}
struct Useritem {
    let classicfeed:Int?
    let deliciousfeed:Int?
    let novalleyfeed:Int?
    let classiccan:Int?
    let fishcan:Int?
    init(aDoc:DocumentSnapshot){
        self.classicfeed = aDoc.get("classicfeed") as? Int ?? 0
        self.deliciousfeed = aDoc.get("deliciousfeed") as? Int ?? 0
        self.novalleyfeed = aDoc.get("novalleyfeed") as? Int ?? 0
        self.classiccan = aDoc.get("classiccan") as? Int ?? 0
        self.fishcan = aDoc.get("fishcan") as? Int ?? 0
    }
}
struct Smokerecord_October {
    let _1st:Int?
    let _2nd:Int?
    let _3rd:Int?
    let _4th:Int?
    let _5th:Int?
    let _6th:Int?
    let _7th:Int?
    let first_week:Int?
    init(aDoc:DocumentSnapshot){
        self._1st = aDoc.get("1st") as? Int ?? 0
        self._2nd = aDoc.get("2nd") as? Int ?? 0
        self._3rd = aDoc.get("3rd") as? Int ?? 0
        self._4th = aDoc.get("4th") as? Int ?? 0
        self._5th = aDoc.get("5th") as? Int ?? 0
        self._6th = aDoc.get("6th") as? Int ?? 0
        self._7th = aDoc.get("7th") as? Int ?? 0
        self.first_week = aDoc.get("first_week") as? Int ?? 0
    }
}
struct Smokerecord_November {
    let _1st:Int?
    let _2nd:Int?
    let _3rd:Int?
    let _4th:Int?
    let _5th:Int?
    let _6th:Int?
    let _7th:Int?
    let first_week:Int?
    init(aDoc:DocumentSnapshot){
        self._1st = aDoc.get("1st") as? Int ?? 0
        self._2nd = aDoc.get("2nd") as? Int ?? 0
        self._3rd = aDoc.get("3rd") as? Int ?? 0
        self._4th = aDoc.get("4th") as? Int ?? 0
        self._5th = aDoc.get("5th") as? Int ?? 0
        self._6th = aDoc.get("6th") as? Int ?? 0
        self._7th = aDoc.get("7th") as? Int ?? 0
        self.first_week = aDoc.get("first_week") as? Int ?? 0
    }
}
struct Smokerecord_Mood {
    let awesome:Int?
    let sin:Int?
    let sad:Int?
    let comfortable:Int?
    let angry:Int?
    init(aDoc:DocumentSnapshot){
        self.awesome = aDoc.get("awesome") as? Int ?? 0
        self.sin = aDoc.get("sin") as? Int ?? 0
        self.sad = aDoc.get("sad") as? Int ?? 0
        self.comfortable = aDoc.get("comfortable") as? Int ?? 0
        self.angry = aDoc.get("angry") as? Int ?? 0
    }
}
struct Smokerecord_Situation {
    let boring:Int?
    let hungry:Int?
    let full:Int?
    let fatigue:Int?
    let outofspirits:Int?
    let getup:Int?
    let invite:Int?
    init(aDoc:DocumentSnapshot){
        self.boring = aDoc.get("boring") as? Int ?? 0
        self.hungry = aDoc.get("hungry") as? Int ?? 0
        self.full = aDoc.get("full") as? Int ?? 0
        self.fatigue = aDoc.get("fatigue") as? Int ?? 0
        self.outofspirits = aDoc.get("outofspirits") as? Int ?? 0
        self.getup = aDoc.get("getup") as? Int ?? 0
        self.invite = aDoc.get("invite") as? Int ?? 0
    }
}
struct House {
    let television:String?
    
    init(aDoc:DocumentSnapshot){
        self.television = aDoc.get("television") as? String ?? ""
    }
}

