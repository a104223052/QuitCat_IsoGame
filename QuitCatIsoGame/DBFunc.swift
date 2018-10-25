//
//  DBFunc.swift
//  QuitCatIsoGame
//
//  Created by YPY on 2018/10/25.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import Foundation
import FirebaseFirestore
import Firebase
import UIKit



class DBFunc {
    
    var db: Firestore!
    var local_userdata: Usersdata!
    var local_friend:Friend!
    var local_pet:Pet!
    var local_pet_environment:Pet_Environment!
    var local_useritem:Useritem!
    var local_smokerecord_October:Smokerecord_October!
    var local_smokerecord_November:Smokerecord_November!
    var local_smokerecord_Mood:Smokerecord_Mood!
    var local_smokerecord_Situation:Smokerecord_Situation!
    var local_house:House!
    
    let userID:String = "N23K1DpIYFH5Q38MOunx"
    
    func queryAllfunc(){
        queryAUser()
        queryFriend()
        queryPet()
        queryPet_Environment()
        queryUseritem()
        querySmokerecord_October()
        querySmokerecord_November()
        querySmokerecord_Mood()
        querySmokerecord_Situation()
        queryHouse()
    }
    //queryUserdata
    func queryAUser() {
        let docRef = self.db.collection("Users").document(userID).collection("userdata").document("userdata")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let aUser = Usersdata(aDoc: document)
                self.local_userdata = aUser
            } else {
                print("Document does not exist")
            }
        }
    }
    //queryFriend  doucument uid need to change!!
    func queryFriend() {
        let docRef = self.db.collection("Users").document(userID).collection("friend").document("userdata")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let aUser = Friend(aDoc: document)
                self.local_friend = aUser
            } else {
                print("Document does not exist")
            }
        }
    }
    //queryPet
    func queryPet() {
        let docRef = self.db.collection("Users").document(userID).collection("pet").document("pet")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let aUser = Pet(aDoc: document)
                self.local_pet = aUser
            } else {
                print("Document does not exist")
            }
        }
    }
    //queryPet_Environment
    func queryPet_Environment() {
        let docRef = self.db.collection("Users").document(userID).collection("pet").document("environment")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let aUser = Pet_Environment(aDoc: document)
                self.local_pet_environment = aUser
            } else {
                print("Document does not exist")
            }
        }
    }
    //queryUseritem
    func queryUseritem() {
        let docRef = self.db.collection("Users").document(userID).collection("item").document("useritem")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let aUser = Useritem(aDoc: document)
                self.local_useritem = aUser
            } else {
                print("Document does not exist")
            }
        }
    }
    //querySmokerecord_October
    func querySmokerecord_October() {
        let docRef = self.db.collection("Users").document(userID).collection("smokerecord").document("October")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let aUser = Smokerecord_October(aDoc: document)
                self.local_smokerecord_October = aUser
            } else {
                print("Document does not exist")
            }
        }
    }
    //querySmokerecord_November
    func querySmokerecord_November() {
        let docRef = self.db.collection("Users").document(userID).collection("smokerecord").document("November")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let aUser = Smokerecord_November(aDoc: document)
                self.local_smokerecord_November = aUser
            } else {
                print("Document does not exist")
            }
        }
    }
    //querySmokerecord_Mood
    func querySmokerecord_Mood() {
        let docRef = self.db.collection("Users").document(userID).collection("smokerecord").document("mood")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let aUser = Smokerecord_Mood(aDoc: document)
                self.local_smokerecord_Mood = aUser
            } else {
                print("Document does not exist")
            }
        }
    }
    //querySmokerecord_Situation
    func querySmokerecord_Situation() {
        let docRef = self.db.collection("Users").document(userID).collection("smokerecord").document("situation")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let aUser = Smokerecord_Situation(aDoc: document)
                self.local_smokerecord_Situation = aUser
            } else {
                print("Document does not exist")
            }
        }
    }
    //queryHouse
    func queryHouse() {
        let docRef = self.db.collection("Users").document(userID).collection("house").document("house")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let aUser = House(aDoc: document)
                self.local_house = aUser
            } else {
                print("Document does not exist")
            }
        }
    }

    func setFunc(schema:String,collection:String,document:String,upload:Int){
        
        db.collection("Users").document(userID).collection(collection).document(document).updateData(
            [schema:upload]
        ) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    func setFunc(schema:String,collection:String,document:String,upload:String){
        
        db.collection("Users").document(userID).collection(collection).document(document).updateData(
            [schema:upload]
        ) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
}
