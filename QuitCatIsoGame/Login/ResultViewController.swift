//
//  ResultViewController.swift
//  QuitCatIsoGame
//
//  Created by 熊開智 on 2018/11/2.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import UIKit
import Firebase

class ResultViewController: UIViewController, SSRadioButtonControllerDelegate {
    func didSelectButton(selectedButton: UIButton?) {
        
    }

    let db = Firestore.firestore()
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet var radioButton: [UIButton]!
    
    
    var radioButtonController: SSRadioButtonsController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreView.layer.cornerRadius = 10
        contentView.layer.cornerRadius = 10
        radioButtonController = SSRadioButtonsController(buttons: radioButton)
        radioButtonController!.delegate = self
        radioButtonController!.shouldLetDeSelect = true
        // Do any additional setup after loading the view.
    }
    //Kai neet to fill
    //輸入完成之後要叫下面這一串 userID,upload兩格要填
    //setFunc(userID: "", collection: "userdata", document: "userdata", schema: "smokeaddiction", upload: "")

    

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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
