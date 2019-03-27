//
//  DBFunc.swift
//  QuitCatIsoGame
//
//  Created by YPY on 2018/10/25.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import Foundation
//import FirebaseFirestore
//import Firebase
import UIKit

class DBFunc {
  
    let urlToRequest = "http://musicrun.shu.edu.tw/quitcat/api/"
   
    func dataRequest(apiFunc:String, data:String) {
        let url4 = URL(string: urlToRequest + apiFunc)!
        let session4 = URLSession.shared
        let request = NSMutableURLRequest(url: url4)
        request.httpMethod = "POST"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let paramString = data
        request.httpBody = paramString.data(using: String.Encoding.utf8)
        let task = session4.dataTask(with: request as URLRequest) { (data, response, error) in
            guard let _: Data = data, let _: URLResponse = response, error == nil else {
                print("*****error")
                return
            }
            let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("*****This is the data 4: \(dataString)") //JSONSerialization
        }
        task.resume()
    }
    
    func Register(FbID:String, FbToken:String, name:String, email:String){
    
        let postData =
            "?" + "FbID=" + FbID + "&" + "FbToken=" + FbToken + "&" + "name=" + name + "&" + "email=" + email
        
        dataRequest(apiFunc: "Redister", data: postData);
    }
    
    func requestWithUrlencodedBody(urlString: String, parameters: String, completion: @escaping (Data) -> Void){
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpBody = parameters.data(using: String.Encoding.utf8)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        fetchedDataByDataTask(from: request, completion: completion)
        
    }
    private func fetchedDataByDataTask(from request: URLRequest, completion: @escaping (Data) -> Void){
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error != nil{
                print(error as Any)
            }else{
                guard let data = data else{return}
                completion(data)
            }
        }
        task.resume()
    }
    

//    var db: Firestore!
//    var local_userdata: Usersdata!
//    var local_friend:Friend!
//    var local_pet:Pet!
//    var local_pet_environment:Pet_Environment!
//    var local_useritem:Useritem!
//    var local_Smokerecord:Smokerecord!
//    var local_smokerecord_Mood:Smokerecord_Mood!
//    var local_smokerecord_Situation:Smokerecord_Situation!
//    var local_house:House!
//
//    let userID:String = "N23K1DpIYFH5Q38MOunx"
//
//    func queryAllfunc(){
//        queryAUser()
//        queryFriend()
//        queryPet()
//        queryPet_Environment()
//        queryUseritem()
//        querySmokerecord()
//        querySmokerecord_Mood()
//        querySmokerecord_Situation()
//        queryHouse()
//    }
//    //queryUserdata
//    func queryAUser() {
//        let docRef = self.db.collection("Users").document(userID).collection("userdata").document("userdata")
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let aUser = Usersdata(aDoc: document)
//                self.local_userdata = aUser
//            } else {
//                print("Document does not exist")
//            }
//        }
//    }
//    //queryFriend  doucument uid need to change!!
//    func queryFriend() {
//        let docRef = self.db.collection("Users").document(userID).collection("friend").document("userdata")
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let aUser = Friend(aDoc: document)
//                self.local_friend = aUser
//            } else {
//                print("Document does not exist")
//            }
//        }
//    }
//    //queryPet
//    func queryPet() {
//        let docRef = self.db.collection("Users").document(userID).collection("pet").document("pet")
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let aUser = Pet(aDoc: document)
//                self.local_pet = aUser
//            } else {
//                print("Document does not exist")
//            }
//        }
//    }
//    //queryPet_Environment
//    func queryPet_Environment() {
//        let docRef = self.db.collection("Users").document(userID).collection("pet").document("environment")
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let aUser = Pet_Environment(aDoc: document)
//                self.local_pet_environment = aUser
//            } else {
//                print("Document does not exist")
//            }
//        }
//    }
//    //queryUseritem
//    func queryUseritem() {
//        let docRef = self.db.collection("Users").document(userID).collection("item").document("useritem")
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let aUser = Useritem(aDoc: document)
//                self.local_useritem = aUser
//            } else {
//                print("Document does not exist")
//            }
//        }
//    }
//    //querySmokerecord_October
//    func querySmokerecord() {
//        let docRef = self.db.collection("Users").document(userID).collection("smokerecord").document("October")
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let aUser = Smokerecord(aDoc: document)
//                self.local_Smokerecord = aUser
//            } else {
//                print("Document does not exist")
//            }
//        }
//    }
//    //querySmokerecord_November
//
//    //querySmokerecord_Mood
//    func querySmokerecord_Mood() {
//        let docRef = self.db.collection("Users").document(userID).collection("smokerecord").document("mood")
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let aUser = Smokerecord_Mood(aDoc: document)
//                self.local_smokerecord_Mood = aUser
//            } else {
//                print("Document does not exist")
//            }
//        }
//    }
//    //querySmokerecord_Situation
//    func querySmokerecord_Situation() {
//        let docRef = self.db.collection("Users").document(userID).collection("smokerecord").document("situation")
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let aUser = Smokerecord_Situation(aDoc: document)
//                self.local_smokerecord_Situation = aUser
//            } else {
//                print("Document does not exist")
//            }
//        }
//    }
//    //queryHouse
//    func queryHouse() {
//        let docRef = self.db.collection("Users").document(userID).collection("house").document("house")
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let aUser = House(aDoc: document)
//                self.local_house = aUser
//            } else {
//                print("Document does not exist")
//            }
//        }
//    }
//
//    func setFunc(schema:String,collection:String,document:String,upload:Int){
//
//        db.collection("Users").document(userID).collection(collection).document(document).updateData(
//            [schema:upload]
//        ) { err in
//            if let err = err {
//                print("Error writing document: \(err)")
//            } else {
//                print("Document successfully written!")
//            }
//        }
//    }
//
//    func setFunc(userID:String,collection:String,document:String,schema:String,upload:String){
//
//        db.collection("Users").document(userID).collection(collection).document(document).updateData(
//            [schema:upload]
//        ) { err in
//            if let err = err {
//                print("Error writing document: \(err)")
//            } else {
//                print("Document successfully written!")
//            }
//        }
//    }
//
}
