//
//  GameViewController.swift
//  QuitCatIsoGame
//
//  Created by 熊開智 on 2018/10/31.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import UIKit
import Firebase

class TestGameViewController: UIViewController, SSRadioButtonControllerDelegate{
    func didSelectButton(selectedButton: UIButton?) {
        
    }

    @IBOutlet weak var myGifView: UIImageView!
    @IBOutlet weak var feedView: UIView!
    @IBOutlet var selectedButton: [UIButton]!
    @IBOutlet weak var settingBar: UISlider!
    @IBOutlet weak var settinglabel: UILabel!
    
    
    @IBOutlet var recordView: [UIView]!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var ddcountlabel: UILabel!
    var db:Firestore!
    var local_userdata: Usersdata!
    var record = 0
    var count = 1
    
    var radioButtonController1: SSRadioButtonsController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        
        myGifView.loadGif(name: "standtest_0")
        
        radioButtonController1 = SSRadioButtonsController(buttons: selectedButton)//cp this
        radioButtonController1!.delegate = self//cp this
        radioButtonController1!.shouldLetDeSelect = true
        feedView.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
        
        //kai need to fill userID
        //queryAUser(userID: "userID")
        
        //And you can call like  let score = local_userdata.score  to get score

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        for myView in recordView
        {
            view.addSubview(myView)
            myView.layer.cornerRadius = 10
            
            myView.translatesAutoresizingMaskIntoConstraints = false
            myView.widthAnchor.constraint(equalToConstant: 340).isActive = true
            myView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
            
            if myView.tag == 0{
                let c = myView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 318)
                myView.heightAnchor.constraint(equalToConstant: 318).isActive = true
                c.identifier = "recordView1Bottom"
                c.isActive = true
            }
            else if myView.tag == 1{
                let c = myView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 255)
                myView.heightAnchor.constraint(equalToConstant: 255).isActive = true
                c.identifier = "recordView2Bottom"
                c.isActive = true
            }else if myView.tag == 2{
                let c = myView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 223)
                myView.heightAnchor.constraint(equalToConstant: 223).isActive = true
                c.identifier = "recordView3Bottom"
                c.isActive = true
            }
            
            
        }
        super.viewWillAppear(animated)
    }
    
    
    @IBAction func UP(_ sender: Any) {
        count += 1
        countLabel.text = String(count)
        ddcountlabel.text = "剩餘 " + String(10 - count) + " 支"
    }
    
    @IBAction func down(_ sender: Any) {
        if count != 0 {
            count -= 1
            countLabel.text = String(count)
            ddcountlabel.text = "剩餘 " + String(10 - count) + " 支"
        }
    }
    
    @IBAction func settingBar(_ sender: Any) {
        if settingBar.value == Float(0) {
            settinglabel.text = "今天不抽"
        }
        else{
            settinglabel.text = String(Int(settingBar.value * 100)) + "%"
        }
    }
    
    @IBAction func feeding(_ sender: Any) {
        displayDatePickerView(true)
    }
    @IBAction func feeding1(_ sender: Any) {
        displayDatePickerView(true)
    }
    @IBAction func feeding2(_ sender: Any) {
        displayDatePickerView(true)
    }
    
    @IBAction func feeding3(_ sender: Any) {
        displayDatePickerView(true)
        
        //kai neet to fill
        
        //time = 2018/11/10 , ratio = 50% , doint = "Drink" , daysmokecount = "2"
//        addSmokeRecordFunc(userID: "userID", time: "", ratio: "", doing: "", daysmokecount: "")
    }
    
    func displayDatePickerView(_ show: Bool)
    {
        for c in view.constraints
        {
            if(record == 0)
            {
                if c.identifier == "recordView1Bottom"
                {
                    record = 1
                    c.constant = (show) ? -40 : 318
                    break
                }
            }
            else if (record == 1)
            {
                if c.identifier == "recordView1Bottom"
                {
                    c.constant = (show) ? 318 : -40
                    
                    for cc in view.constraints
                    {
                        if cc.identifier == "recordView2Bottom"
                        {
                            record = 2
                            cc.constant = (show) ? -40 : 255
                            break
                        }
                    }
                    break
                }
                
            }
            else if (record == 2)
            {
                if c.identifier == "recordView2Bottom"
                {
                    c.constant = (show) ? 255 : -40
                    
                    for cc in view.constraints
                    {
                        if cc.identifier == "recordView3Bottom"
                        {
                            record = 3
                            cc.constant = (show) ? -40 : 223
                            break
                        }
                    }
                    break
                }
            }
            else if (record == 3)
            {
                if c.identifier == "recordView3Bottom"
                {
                    record = 0
                    c.constant = (show) ? 223 : -40
                    break
                }
            }
        }
        
        UIView.animate(withDuration: 0.5)
        {
            self.view.layoutIfNeeded()
        }
    }
    
    func addSmokeRecordFunc(userID:String,time:String,ratio:String,doing:String,daysmokecount:String){
        db.collection("Users").document(userID).collection("smokerecord").addDocument(data:[
            "time" :time ,
            "ratio" : ratio,
            "doing" : doing,
            "daysmokecount" : daysmokecount
        ]){err in
            if let err = err{
                print("Error add")
            }else{
                print("Document add")
            }
        }
    }
    func setFunc(userID:String,collection:String,document:String,schema:String,upload:String){
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
    //queryUserdata
    func queryAUser(userID : String) {
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
