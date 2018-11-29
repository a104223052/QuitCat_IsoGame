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
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet var statusView: UIView!
    @IBOutlet weak var lifeslider: UISlider!
    @IBOutlet weak var hungryslider: UISlider!
    @IBOutlet weak var moodslider: UISlider!
    @IBOutlet weak var environmentslider: UISlider!
    @IBOutlet weak var statuslabel: UILabel!
    
    
    
    let screenBoundsHeight = UIScreen.main.bounds.size.height
    
    let screenBoundsWidth  = UIScreen.main.bounds.size.width
    let userDefault = UserDefaults.standard
    var db:Firestore!
    var local_userdata: Usersdata!
    var local_pet:Pet!
    var local_pet_environment:Pet_Environment!
    var gradientlayer:CAGradientLayer!
    var viewname:String = ""
    var record = 0
    var count = 1
    var status:Bool = true
    
    var radioButtonController1: SSRadioButtonsController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        myGifView.loadGif(name: "standtest_0")
        myGifView.isUserInteractionEnabled = true
        myGifView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.imageTap)))
        radioButtonController1 = SSRadioButtonsController(buttons: selectedButton)//cp this
        radioButtonController1!.delegate = self//cp this
        radioButtonController1!.shouldLetDeSelect = true
        
        let size = CGSize(width: 1, height: 1)
        UIGraphicsBeginImageContext(size)
        let finalImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        lifeslider.setThumbImage(finalImage, for: .normal)
        hungryslider.setThumbImage(finalImage, for: .normal)
        moodslider.setThumbImage(finalImage, for: .normal)
        environmentslider.setThumbImage(finalImage, for: .normal)

        
        
        feedView.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
        //kai need to fill userID
        queryAUser(userID: "LWgrvASWtBeExgf9yIq2pIj0Toa2")
        queryPet(userID: "LWgrvASWtBeExgf9yIq2pIj0Toa2")
        queryPet_Environment(userID: "LWgrvASWtBeExgf9yIq2pIj0Toa2")
        
        
        
    }
    @objc func imageTap(){
        displayPetStatusView(true)
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
        
        view.addSubview(statusView)
        statusView.layer.cornerRadius = 10
        statuslabel.layer.cornerRadius = 10
        statuslabel.layer.masksToBounds = true
        statusView.translatesAutoresizingMaskIntoConstraints = false
        statusView.widthAnchor.constraint(equalToConstant: 244).isActive = true
        statusView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        statusView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (screenBoundsWidth-244)/2).isActive=true
        
        let cd = statusView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 341)
        
        cd.identifier = "petStatus"
        cd.isActive = true
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
        if let userID = self.userDefault.string(forKey: "userID") {
            addSmokeRecordFunc(userID: userID, time: getUTCDate(), ratio: String(format: "%.2f", settingBar.value), doing: (radioButtonController1?.selectedButton()?.titleLabel?.text)!, daysmokecount: countLabel.text!)
        }
    }
    @IBAction func cancelFeeding(_ sender: Any) {
        cancelDatePickerView()
    }
    func creatGradientLayer(){
        gradientlayer = CAGradientLayer()
        gradientlayer.frame = self.view.bounds
    }
    
    func displayPetStatusView(_ show:Bool){
        lifeslider.setValue(Float(local_pet.life!), animated: true)
        hungryslider.setValue(Float(local_pet.hungry!), animated: true)
        moodslider.setValue(Float(local_pet.mood!), animated: true)
        environmentslider.setValue(Float(local_pet_environment.oxygen! - local_pet_environment.co2!), animated: true)
        var tempHeight = (screenBoundsHeight-130)/2
        if(status == true){
            for c in view.constraints{
                if c.identifier == "petStatus"
                {
                    c.constant = (show) ? -40 : tempHeight
                    status = false
                    break
                }
            }
        }else if(status == false){
            for c in view.constraints{
                if c.identifier == "petStatus"
                {
                    c.constant = (show) ? tempHeight : -40
                    status = true
                    break
                }
            }
        }
        UIView.animate(withDuration: 0.5)
        {
            self.view.layoutIfNeeded()
        }
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
    
    func cancelDatePickerView() {
        var count: Int = 3
        record = 0
        for c in view.constraints
        {
            if c.identifier == "recordView1Bottom"
            {
                c.constant = 318
                count -= 1
            }
            if c.identifier == "recordView2Bottom"
            {
                c.constant = 255
                count -= 1
            }
            if c.identifier == "recordView3Bottom"
            {
                c.constant = 223
                count -= 1
            }
            if count == 0
            {
                break
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
    
    func queryPet(userID : String) {
        let docRef = self.db.collection("Users").document(userID).collection("pet").document("pet")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let aUser = Pet(aDoc: document)
                self.local_pet = aUser
                print("Success query")
            } else {
                print("Document does not exist")
            }
        }
    }
    //queryPet_Environment
    func queryPet_Environment(userID : String) {
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
    
    func getUTCDate() -> String
    {
        // 獲取當前時間
        let now:Date = Date()
        // 建立時間格式
        let dateFormat:DateFormatter = DateFormatter()
        dateFormat.dateFormat = "yyyy/MM/dd/HH:mm:ss"
        
        // 將當下時間轉換成設定的時間格式
        let dateString:String = dateFormat.string(from: now)
        
        return dateString
    }
    
    func getSelectedButton(buttonCollection: [UIButton]) -> UIButton {
        var btn = UIButton()
        for button in buttonCollection {
            if button.isSelected {
                btn = button
            }
        }
        return btn
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }


}
