//
//  CommunityViewController.swift
//  QuitCatIsoGame
//
//  Created by 熊開智 on 2018/10/29.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import UIKit
import Firebase
/***
 #database
 1. 需要讀取使用者的好友清單與資訊 （
 //uid name photo promise smokeCountYesterday score reduceRate friend's smoke record(collection) -> 8 items
 
 ArrayList -> []
 
 2. 點擊畫面有邊小房子要連結好友的
 */

class CommunityViewController: UIViewController {

    
    @IBOutlet weak var ContentView: UIView!
    @IBOutlet var OptionView: [UIView]!
    @IBOutlet weak var friendPhotoImage: UIButton!
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ContentView.layer.cornerRadius = 20
        ContentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        ContentView.layer.shadowOpacity = 0.7
        ContentView.layer.shadowRadius = 5
        ContentView.layer.shadowColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor
        
        for optionView in OptionView
        {
            optionView.layer.shadowOffset = CGSize(width: 0, height: 2)
            optionView.layer.shadowOpacity = 0.7
            optionView.layer.shadowColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor
        }
        
//        let containerViewHeight = OptionView[0].frame.size.height - 16
//        friendPhotoImage.frame = CGRect(x: 8, y: 8, width: containerViewHeight, height: containerViewHeight)
        friendPhotoImage.layer.cornerRadius = friendPhotoImage.frame.size.width/2
        friendPhotoImage.layer.borderColor = UIColor.init(red: 83/255, green: 120/255, blue: 158/255, alpha: 1).cgColor
        friendPhotoImage.layer.borderWidth = 2
        friendPhotoImage.clipsToBounds = true
        // Do any additional setup after loading the view.
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
