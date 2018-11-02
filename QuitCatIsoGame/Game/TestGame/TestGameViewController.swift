//
//  GameViewController.swift
//  QuitCatIsoGame
//
//  Created by 熊開智 on 2018/10/31.
//  Copyright © 2018 Kai Kuma. All rights reserved.
//

import UIKit

class TestGameViewController: UIViewController {

    @IBOutlet weak var myGifView: UIImageView!
    @IBOutlet var recordView: UIView!
    @IBOutlet weak var feedView: UIView!
    @IBOutlet var feedCompleteView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        recordView.layer.borderWidth = 3
        recordView.layer.borderColor = UIColor.white.cgColor
        
        myGifView.loadGif(name: "standtest_0")
        feedView.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.addSubview(feedCompleteView)
        feedCompleteView.translatesAutoresizingMaskIntoConstraints = false
        
//        feedCompleteView.heightAnchor.constraint(equalToConstant: 128).isActive = true
//        feedCompleteView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
//        feedCompleteView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        let c = feedCompleteView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -128)
        c.identifier = "pickerViewBottom"
        c.isActive = true
        
        feedView.layer.cornerRadius = 10
        
        super.viewWillAppear(animated)
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
